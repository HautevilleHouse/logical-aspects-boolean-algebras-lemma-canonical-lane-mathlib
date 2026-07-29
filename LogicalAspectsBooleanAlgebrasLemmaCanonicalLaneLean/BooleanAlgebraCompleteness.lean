import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean.BooleanAlgebraAxioms
import HautevilleHouse.LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean.BooleanAlgebraHomomorphism

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean

structure BooleanAlgebraCompleteness (B : BooleanAlgebraAxioms) where
  embedding : BooleanAlgebraHomomorphism B (PowerSetAlgebra (SomeType))
  embedding_injective : Function.Injective embedding.map

def BooleanAlgebraCompletenessClosed (B : BooleanAlgebraAxioms) (c : BooleanAlgebraCompleteness B) : Prop :=
  c.embedding_injective

end LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse