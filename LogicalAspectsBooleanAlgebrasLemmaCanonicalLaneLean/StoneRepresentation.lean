import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean.BooleanAlgebraStructure

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean

structure StoneRepresentationPackage (B : BooleanAlgebraPackage) where
  ultrafilters : Type u
  topology : TopologicalSpace ultrafilters
  isCompact : CompactSpace ultrafilters
  isTotallyDisconnected : TotallyDisconnectedSpace ultrafilters
  isT2 : T2Space ultrafilters
  repMap : B.carrier → Set ultrafilters
  repMap_inj : Function.Injective repMap
  repMap_meet : ∀ a b : B.carrier, repMap (B.meet a b) = repMap a ∩ repMap b
  repMap_join : ∀ a b : B.carrier, repMap (B.join a b) = repMap a ∪ repMap b
  repMap_complement : ∀ a : B.carrier, repMap (B.complement a) = (repMap a)ᶜ
  repMap_top : repMap B.top = Set.univ
  repMap_bot : repMap B.bot = ∅

def StoneRepresentationClosed {B : BooleanAlgebraPackage} (S : StoneRepresentationPackage B) : Prop :=
  S.repMap_inj ∧ S.repMap_meet ∧ S.repMap_join ∧ S.repMap_complement ∧ S.repMap_top ∧ S.repMap_bot

theorem stone_representation_closed {B : BooleanAlgebraPackage} (S : StoneRepresentationPackage B) : StoneRepresentationClosed S :=
  And.intro S.repMap_inj (And.intro S.repMap_meet (And.intro S.repMap_join (And.intro S.repMap_complement (And.intro S.repMap_top S.repMap_bot))))

end LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse