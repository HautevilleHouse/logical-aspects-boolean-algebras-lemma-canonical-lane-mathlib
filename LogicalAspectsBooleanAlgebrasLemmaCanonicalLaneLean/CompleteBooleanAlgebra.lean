import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean

structure CompleteBooleanAlgebraPackage (B : BooleanAlgebraPackage) where
  inf : Set B.carrier → B.carrier
  sup : Set B.carrier → B.carrier
  glbProperty : ∀ (s : Set B.carrier), B.meet (inf s) (B.complement (inf s)) = B.bot
  lubProperty : ∀ (s : Set B.carrier), B.join (sup s) (B.complement (sup s)) = B.top
  infMeet : ∀ (s : Set B.carrier) (a : B.carrier), B.meet (inf s) a = inf {b ∈ s | B.meet b a = a}
  supJoin : ∀ (s : Set B.carrier) (a : B.carrier), B.join (sup s) a = sup {b ∈ s | B.join b a = a}

structure CompleteBooleanAlgebraEvidence (B : BooleanAlgebraPackage) (C : CompleteBooleanAlgebraPackage B) where
  glbPropertyClosed : C.glbProperty
  lubPropertyClosed : C.lubProperty
  infMeetClosed : C.infMeet
  supJoinClosed : C.supJoin

def CompleteBooleanAlgebraClosed (B : BooleanAlgebraPackage) (C : CompleteBooleanAlgebraPackage B) : Prop :=
  C.glbProperty ∧ C.lubProperty ∧ C.infMeet ∧ C.supJoin

theorem complete_boolean_algebra_closed_from_evidence (B : BooleanAlgebraPackage)
    (C : CompleteBooleanAlgebraPackage B) (E : CompleteBooleanAlgebraEvidence B C) :
    CompleteBooleanAlgebraClosed B C := by
  exact And.intro E.glbPropertyClosed
    (And.intro E.lubPropertyClosed
      (And.intro E.infMeetClosed E.supJoinClosed))

end LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse