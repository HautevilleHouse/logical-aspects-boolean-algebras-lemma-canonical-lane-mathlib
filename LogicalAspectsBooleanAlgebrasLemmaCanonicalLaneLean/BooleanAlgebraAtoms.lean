import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean

structure AtomDefinition (B : BooleanAlgebraPackage) where
  isAtom : B.carrier → Prop
  atomDef : ∀ (a : B.carrier), isAtom a ↔ (a ≠ B.bot ∧ ∀ (b : B.carrier), B.meet a b = b ∨ B.meet a b = B.bot)

structure AtomisticBooleanAlgebra (B : BooleanAlgebraPackage) (A : AtomDefinition B) where
  generatedByAtoms : ∀ (x : B.carrier), x ≠ B.bot → ∃ (a : B.carrier), A.isAtom a ∧ B.meet a x = a

structure AtomisticEvidence (B : BooleanAlgebraPackage) (A : AtomDefinition B) (At : AtomisticBooleanAlgebra B A) where
  generatedByAtomsClosed : At.generatedByAtoms

def AtomisticClosed (B : BooleanAlgebraPackage) (A : AtomDefinition B) (At : AtomisticBooleanAlgebra B A) : Prop :=
  At.generatedByAtoms

theorem atomistic_closed_from_evidence (B : BooleanAlgebraPackage) (A : AtomDefinition B)
    (At : AtomisticBooleanAlgebra B A) (E : AtomisticEvidence B A At) :
    AtomisticClosed B A At := by
  exact E.generatedByAtomsClosed

end LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse