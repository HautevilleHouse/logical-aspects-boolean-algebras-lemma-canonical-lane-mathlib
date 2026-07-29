import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean

structure BooleanAlgebra (α : Type u) where
  top : α
  bot : α
  comp : α → α
  meet : α → α → α
  join : α → α → α
  meet_comm : ∀ a b : α, meet a b = meet b a
  join_comm : ∀ a b : α, join a b = join b a
  meet_assoc : ∀ a b c : α, meet (meet a b) c = meet a (meet b c)
  join_assoc : ∀ a b c : α, join (join a b) c = join a (join b c)
  meet_absorb_join : ∀ a b : α, meet a (join a b) = a
  join_absorb_meet : ∀ a b : α, join a (meet a b) = a
  meet_comp : ∀ a : α, meet a (comp a) = bot
  join_comp : ∀ a : α, join a (comp a) = top
  top_bot_distinct : top ≠ bot

structure BooleanAlgebraEvidence (α : Type u) (B : BooleanAlgebra α) where
  meet_comm_closed : B.meet_comm
  join_comm_closed : B.join_comm
  meet_assoc_closed : B.meet_assoc
  join_assoc_closed : B.join_assoc
  meet_absorb_join_closed : B.meet_absorb_join
  join_absorb_meet_closed : B.join_absorb_meet
  meet_comp_closed : B.meet_comp
  join_comp_closed : B.join_comp
  top_bot_distinct_closed : B.top_bot_distinct

def BooleanAlgebraClosed {α : Type u} (B : BooleanAlgebra α) : Prop :=
  B.meet_comm ∧ B.join_comm ∧ B.meet_assoc ∧ B.join_assoc ∧
  B.meet_absorb_join ∧ B.join_absorb_meet ∧ B.meet_comp ∧ B.join_comp ∧ B.top_bot_distinct

theorem boolean_algebra_closed_from_evidence {α : Type u} (B : BooleanAlgebra α) (E : BooleanAlgebraEvidence α B) : BooleanAlgebraClosed B := by
  exact And.intro E.meet_comm_closed (And.intro E.join_comm_closed (And.intro E.meet_assoc_closed (And.intro E.join_assoc_closed (And.intro E.meet_absorb_join_closed (And.intro E.join_absorb_meet_closed (And.intro E.meet_comp_closed (And.intro E.join_comp_closed E.top_bot_distinct_closed)))))))

end LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse