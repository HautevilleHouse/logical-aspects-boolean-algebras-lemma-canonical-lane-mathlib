import canonicalLaneMathlib.AdmissibleClass
import LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean.BooleanAlgebraStructure

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean

structure BooleanAlgebraHomomorphism (α β : Type u) (A : BooleanAlgebra α) (B : BooleanAlgebra β) where
  map : α → β
  preserve_top : map A.top = B.top
  preserve_bot : map A.bot = B.bot
  preserve_comp : ∀ a : α, map (A.comp a) = B.comp (map a)
  preserve_meet : ∀ a b : α, map (A.meet a b) = B.meet (map a) (map b)
  preserve_join : ∀ a b : α, map (A.join a b) = B.join (map a) (map b)

structure BooleanAlgebraHomomorphismEvidence {α β : Type u} {A : BooleanAlgebra α} {B : BooleanAlgebra β} (H : BooleanAlgebraHomomorphism α β A B) where
  preserve_top_closed : H.preserve_top
  preserve_bot_closed : H.preserve_bot
  preserve_comp_closed : H.preserve_comp
  preserve_meet_closed : H.preserve_meet
  preserve_join_closed : H.preserve_join

def BooleanAlgebraHomomorphismClosed {α β : Type u} {A : BooleanAlgebra α} {B : BooleanAlgebra β} (H : BooleanAlgebraHomomorphism α β A B) : Prop :=
  H.preserve_top ∧ H.preserve_bot ∧ H.preserve_comp ∧ H.preserve_meet ∧ H.preserve_join

theorem boolean_algebra_homomorphism_closed_from_evidence {α β : Type u} {A : BooleanAlgebra α} {B : BooleanAlgebra β} (H : BooleanAlgebraHomomorphism α β A B) (E : BooleanAlgebraHomomorphismEvidence H) : BooleanAlgebraHomomorphismClosed H := by
  exact And.intro E.preserve_top_closed (And.intro E.preserve_bot_closed (And.intro E.preserve_comp_closed (And.intro E.preserve_meet_closed E.preserve_join_closed)))

end LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse