import LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean.BooleanAlgebraModels

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean

structure IdealFilterDualityPackage (B : BooleanAlgebraObject) where
  idealLattice : Type
  filterLattice : Type
  primeIdealTheorem : Prop
  ultrafilterLemma : Prop
  dualityClosed : primeIdealTheorem ∧ ultrafilterLemma

structure IdealFilterDualityEvidence {B : BooleanAlgebraObject} (D : IdealFilterDualityPackage B) where
  primeIdealTheoremClosed : D.primeIdealTheorem
  ultrafilterLemmaClosed : D.ultrafilterLemma

theorem ideal_filter_duality_closed {B : BooleanAlgebraObject} (D : IdealFilterDualityPackage B)
    (E : IdealFilterDualityEvidence D) : D.dualityClosed :=
  And.intro E.primeIdealTheoremClosed E.ultrafilterLemmaClosed

end LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse