import LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean

structure AdmissibleClass where
  object : BooleanAlgebraAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  BooleanAlgebraWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse