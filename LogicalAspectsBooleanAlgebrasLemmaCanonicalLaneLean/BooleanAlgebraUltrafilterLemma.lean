import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean.BooleanAlgebraAxioms

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean

structure Ultrafilter (B : BooleanAlgebraAxioms) where
  set : Set B.carrier
  nonempty : set.Nonempty
  proper : B.top ∉ set
  up_closed : ∀ a ∈ set, ∀ b : B.carrier, B.meet a b ∈ set → b ∈ set
  meet_closed : ∀ a b ∈ set, B.meet a b ∈ set
  join_prime : ∀ a b : B.carrier, B.join a b ∈ set → a ∈ set ∨ b ∈ set

theorem ultrafilter_lemma (B : BooleanAlgebraAxioms) (F : Set B.carrier) (hF : Filter B F) :
  ∃ U : Ultrafilter B, F ⊆ U.set := by
  apply exists_maximal_filter_subset
  exact zorn_lemma
  sorry

def UltrafilterLemmaClosed (B : BooleanAlgebraAxioms) : Prop :=
  ∀ F : Set B.carrier, Filter B F → ∃ U : Ultrafilter B, F ⊆ U.set

end LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse