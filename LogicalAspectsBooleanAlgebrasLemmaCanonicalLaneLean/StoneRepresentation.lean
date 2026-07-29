import canonicalLaneMathlib.AdmissibleClass
import LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean.BooleanAlgebraStructure

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean

structure StoneSpace where
  carrier : Type u
  topology : TopologicalSpace carrier
  compact : CompactSpace carrier
  hausdorff : T2Space carrier
  totallyDisconnected : TotallyDisconnectedSpace carrier

structure StoneRepresentationPackage (α : Type u) (B : BooleanAlgebra α) where
  space : StoneSpace
  representation : BooleanAlgebraHomomorphism α (Set space.carrier) B (Set.stoneAlgebra space.carrier)
  representationInjective : Function.Injective representation.map
  representationSurjective : Function.Surjective representation.map

structure StoneRepresentationEvidence {α : Type u} {B : BooleanAlgebra α} (S : StoneRepresentationPackage α B) where
  representationInjective_closed : S.representationInjective
  representationSurjective_closed : S.representationSurjective

def StoneRepresentationClosed {α : Type u} {B : BooleanAlgebra α} (S : StoneRepresentationPackage α B) : Prop :=
  S.representationInjective ∧ S.representationSurjective

theorem stone_representation_closed_from_evidence {α : Type u} {B : BooleanAlgebra α} (S : StoneRepresentationPackage α B) (E : StoneRepresentationEvidence S) : StoneRepresentationClosed S := by
  exact And.intro E.representationInjective_closed E.representationSurjective_closed

end LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse