import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean.BooleanAlgebraAxioms
import HautevilleHouse.LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean.StoneRepresentation

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean

theorem boolean_algebra_representation_theorem (B : BooleanAlgebraAxioms) :
  StoneRepresentation B := by
  -- Proof using ultrafilter lemma and Stone duality
  let S : StoneSpace := ultraFilterStoneSpace B
  let iso : BooleanAlgebraHomomorphism B (ClopenAlgebra S) := stoneMap B
  have bijective : Function.Bijective iso.map := by
    -- injectivity and surjectivity from Stone duality
    apply And.intro
    · exact stoneMap_injective B
    · exact stoneMap_surjective B
  exact { stoneSpace := S, iso := iso, iso_bijective := bijective }

def BooleanAlgebraRepresentationTheoremClosed (B : BooleanAlgebraAxioms) : Prop :=
  Nonempty (StoneRepresentation B)

end LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse