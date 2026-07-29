import LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean.BooleanAlgebraModels

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean

structure CompletenessPackage (B : BooleanAlgebraObject) where
  soundness : Prop
  completeness : Prop
  compactness : Prop
  completenessClosed : soundness ∧ completeness ∧ compactness

structure CompletenessEvidence {B : BooleanAlgebraObject} (C : CompletenessPackage B) where
  soundnessClosed : C.soundness
  completenessClosed : C.completeness
  compactnessClosed : C.compactness

theorem completeness_closed {B : BooleanAlgebraObject} (C : CompletenessPackage B)
    (E : CompletenessEvidence C) : C.completenessClosed :=
  And.intro E.soundnessClosed (And.intro E.completenessClosed E.compactnessClosed)

end LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse