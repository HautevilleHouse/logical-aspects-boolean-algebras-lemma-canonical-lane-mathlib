import canonicalLaneMathlib.AdmissibleClass
import LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean.BooleanAlgebraStructure

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean

structure Filter {α : Type u} (B : BooleanAlgebra α) where
  carrier : Set α
  top_mem : B.top ∈ carrier
  meet_closed : ∀ a b : α, a ∈ carrier → b ∈ carrier → B.meet a b ∈ carrier
  upward_closed : ∀ a b : α, a ∈ carrier → B.meet a b = a → b ∈ carrier

structure Ultrafilter {α : Type u} (B : BooleanAlgebra α) extends Filter B where
  maximal : ∀ (F' : Filter B), carrier ⊆ F'.carrier → F'.carrier = carrier ∨ F'.carrier = Set.univ
  prime : ∀ a b : α, B.join a b ∈ carrier → a ∈ carrier ∨ b ∈ carrier

structure FilterEvidence {α : Type u} {B : BooleanAlgebra α} (F : Filter B) where
  top_mem_closed : F.top_mem
  meet_closed_closed : F.meet_closed
  upward_closed_closed : F.upward_closed

def FilterClosed {α : Type u} {B : BooleanAlgebra α} (F : Filter B) : Prop :=
  F.top_mem ∧ F.meet_closed ∧ F.upward_closed

theorem filter_closed_from_evidence {α : Type u} {B : BooleanAlgebra α} (F : Filter B) (E : FilterEvidence F) : FilterClosed F := by
  exact And.intro E.top_mem_closed (And.intro E.meet_closed_closed E.upward_closed_closed)

structure UltrafilterEvidence {α : Type u} {B : BooleanAlgebra α} (U : Ultrafilter B) where
  filter_closed : FilterClosed U.toFilter
  maximal_closed : U.maximal
  prime_closed : U.prime

def UltrafilterClosed {α : Type u} {B : BooleanAlgebra α} (U : Ultrafilter B) : Prop :=
  FilterClosed U.toFilter ∧ U.maximal ∧ U.prime

theorem ultrafilter_closed_from_evidence {α : Type u} {B : BooleanAlgebra α} (U : Ultrafilter B) (E : UltrafilterEvidence U) : UltrafilterClosed U := by
  exact And.intro E.filter_closed (And.intro E.maximal_closed E.prime_closed)

end LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse