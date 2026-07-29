import canonicalLaneMathlib.AdmissibleClass
import LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean.BooleanAlgebraStructure

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean

structure CompleteBooleanAlgebra (α : Type u) extends BooleanAlgebra α where
  inf : Set α → α
  sup : Set α → α
  inf_le : ∀ (s : Set α) (a : α), a ∈ s → inf s ≤ a
  le_sup : ∀ (s : Set α) (a : α), a ∈ s → a ≤ sup s
  inf_glb : ∀ (s : Set α) (b : α), (∀ a ∈ s, b ≤ a) → b ≤ inf s
  sup_lub : ∀ (s : Set α) (b : α), (∀ a ∈ s, a ≤ b) → sup s ≤ b

structure CompleteBooleanAlgebraEvidence (α : Type u) (C : CompleteBooleanAlgebra α) where
  inf_le_closed : C.inf_le
  le_sup_closed : C.le_sup
  inf_glb_closed : C.inf_glb
  sup_lub_closed : C.sup_lub

def CompleteBooleanAlgebraClosed (α : Type u) (C : CompleteBooleanAlgebra α) : Prop :=
  C.inf_le ∧ C.le_sup ∧ C.inf_glb ∧ C.sup_lub

theorem complete_boolean_algebra_closed_from_evidence (α : Type u) (C : CompleteBooleanAlgebra α) (E : CompleteBooleanAlgebraEvidence α C) : CompleteBooleanAlgebraClosed α C := by
  exact And.intro E.inf_le_closed (And.intro E.le_sup_closed (And.intro E.inf_glb_closed E.sup_lub_closed))

end LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse