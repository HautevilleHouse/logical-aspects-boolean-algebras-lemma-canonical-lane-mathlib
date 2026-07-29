import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean

structure StoneSpacePackage where
  space : Type u
  topology : TopologicalSpace space
  compact : Prop
  hausdorff : Prop
  totallyDisconnected : Prop
  zeroDimensional : Prop
  compactTerm : compact
  hausdorffTerm : hausdorff
  totallyDisconnectedTerm : totallyDisconnected
  zeroDimensionalTerm : zeroDimensional

structure StoneSpaceEvidence (S : StoneSpacePackage) where
  compactClosed : S.compact
  hausdorffClosed : S.hausdorff
  totallyDisconnectedClosed : S.totallyDisconnected
  zeroDimensionalClosed : S.zeroDimensional

def StoneSpaceClosed (S : StoneSpacePackage) : Prop :=
  S.compact ∧ S.hausdorff ∧ S.totallyDisconnected ∧ S.zeroDimensional

theorem stone_space_closed_from_evidence (S : StoneSpacePackage)
    (E : StoneSpaceEvidence S) : StoneSpaceClosed S := by
  exact And.intro E.compactClosed
    (And.intro E.hausdorffClosed
      (And.intro E.totallyDisconnectedClosed E.zeroDimensionalClosed))

structure BooleanAlgebraStoneBridge (B : BooleanAlgebraPackage) (S : StoneSpacePackage) where
  clopenSetMap : B.carrier → Set S.space
  clopenSetMapInjective : Function.Injective clopenSetMap
  clopenSetMapSurjective : ∀ s : Set S.space, IsClopen s → ∃ x : B.carrier, clopenSetMap x = s
  clopenSetMapRespects : (∀ a b : B.carrier, clopenSetMap (B.meet a b) = clopenSetMap a ∩ clopenSetMap b) ∧
    (∀ a b : B.carrier, clopenSetMap (B.join a b) = clopenSetMap a ∪ clopenSetMap b) ∧
    (∀ a : B.carrier, clopenSetMap (B.complement a) = (clopenSetMap a)ᶜ) ∧
    clopenSetMap B.top = Set.univ ∧ clopenSetMap B.bot = ∅

structure BooleanAlgebraStoneBridgeEvidence {B : BooleanAlgebraPackage} {S : StoneSpacePackage}
    (Br : BooleanAlgebraStoneBridge B S) where
  clopenSetMapInjectiveClosed : Br.clopenSetMapInjective
  clopenSetMapSurjectiveClosed : Br.clopenSetMapSurjective
  clopenSetMapRespectsClosed : Br.clopenSetMapRespects

def BooleanAlgebraStoneBridgeClosed {B : BooleanAlgebraPackage} {S : StoneSpacePackage}
    (Br : BooleanAlgebraStoneBridge B S) : Prop :=
  Br.clopenSetMapInjective ∧ Br.clopenSetMapSurjective ∧ Br.clopenSetMapRespects

theorem boolean_algebra_stone_bridge_closed_from_evidence
    {B : BooleanAlgebraPackage} {S : StoneSpacePackage}
    (Br : BooleanAlgebraStoneBridge B S)
    (E : BooleanAlgebraStoneBridgeEvidence Br) : BooleanAlgebraStoneBridgeClosed Br := by
  exact And.intro E.clopenSetMapInjectiveClosed
    (And.intro E.clopenSetMapSurjectiveClosed E.clopenSetMapRespectsClosed)

end LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse