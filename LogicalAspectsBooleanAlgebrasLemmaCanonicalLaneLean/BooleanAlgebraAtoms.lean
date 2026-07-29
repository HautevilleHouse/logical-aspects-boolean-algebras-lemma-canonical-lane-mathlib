import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean.BooleanAlgebraStructure

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean

structure AtomPackage (B : BooleanAlgebraPackage) where
  atom : B.carrier
  not_bot : atom ≠ B.bot
  minimal : ∀ x : B.carrier, B.meet x atom ≠ B.bot → B.meet x atom = x

def AtomClosed {B : BooleanAlgebraPackage} (A : AtomPackage B) : Prop :=
  A.not_bot ∧ A.minimal

theorem atom_closed {B : BooleanAlgebraPackage} (A : AtomPackage B) : AtomClosed A :=
  And.intro A.not_bot A.minimal

structure AtomicBooleanAlgebraPackage (B : BooleanAlgebraPackage) where
  atoms_exist : ∀ x : B.carrier, x ≠ B.bot → ∃ (A : AtomPackage B), B.meet A.atom x ≠ B.bot

def AtomicBooleanAlgebraClosed {B : BooleanAlgebraPackage} (A : AtomicBooleanAlgebraPackage B) : Prop :=
  A.atoms_exist

theorem atomic_boolean_algebra_closed {B : BooleanAlgebraPackage} (A : AtomicBooleanAlgebraPackage B) : AtomicBooleanAlgebraClosed A :=
  A.atoms_exist

end LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse