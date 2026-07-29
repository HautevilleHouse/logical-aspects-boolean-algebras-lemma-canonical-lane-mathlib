import LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  BooleanAlgebraWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse