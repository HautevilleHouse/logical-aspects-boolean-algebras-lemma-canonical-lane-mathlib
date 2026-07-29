import LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean.BooleanAlgebraModels

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean

structure StoneRepresentationPackage (B : BooleanAlgebraObject) where
  dualSpace : Type
  topology : TopologicalSpace dualSpace
  compactHausdorffZeroDimensional : Prop
  isomorphismToClopenSets : Prop
  representationClosed : compactHausdorffZeroDimensional ∧ isomorphismToClopenSets

structure StoneRepresentationEvidence {B : BooleanAlgebraObject} (S : StoneRepresentationPackage B) where
  compactHausdorffZeroDimensionalClosed : S.compactHausdorffZeroDimensional
  isomorphismToClopenSetsClosed : S.isomorphismToClopenSets

theorem stone_representation_closed {B : BooleanAlgebraObject} (S : StoneRepresentationPackage B)
    (E : StoneRepresentationEvidence S) : S.representationClosed :=
  And.intro E.compactHausdorffZeroDimensionalClosed E.isomorphismToClopenSetsClosed

end LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse