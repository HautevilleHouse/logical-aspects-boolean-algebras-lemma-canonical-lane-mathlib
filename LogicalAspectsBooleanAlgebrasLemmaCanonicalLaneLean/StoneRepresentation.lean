import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean

structure StoneSpace where
  carrier : Type u
  topology : TopologicalSpace carrier
  compact : CompactSpace carrier
  hausdorff : T2Space carrier
  totallyDisconnected : TotallyDisconnectedSpace carrier

structure StoneRepresentationPackage (B : BooleanAlgebraPackage) (S : StoneSpace) where
  repMap : BooleanAlgebraHomomorphism B (CanonicalBooleanAlgebraOfOpenClosedSets S)
  injective : Function.Injective repMap.toFun
  surjective : Function.Surjective repMap.toFun

structure StoneRepresentationEvidence (B : BooleanAlgebraPackage) (S : StoneSpace)
    (R : StoneRepresentationPackage B S) where
  injectiveClosed : R.injective
  surjectiveClosed : R.surjective

def StoneRepresentationClosed (B : BooleanAlgebraPackage) (S : StoneSpace)
    (R : StoneRepresentationPackage B S) : Prop :=
  R.injective ∧ R.surjective

theorem stone_representation_closed_from_evidence (B : BooleanAlgebraPackage) (S : StoneSpace)
    (R : StoneRepresentationPackage B S) (E : StoneRepresentationEvidence B S R) :
    StoneRepresentationClosed B S R := by
  exact And.intro E.injectiveClosed E.surjectiveClosed

end LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse