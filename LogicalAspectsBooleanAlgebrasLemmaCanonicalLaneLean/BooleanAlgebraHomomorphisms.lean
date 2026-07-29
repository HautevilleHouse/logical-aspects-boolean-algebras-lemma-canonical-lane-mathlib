import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean.BooleanAlgebraStructure

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean

structure BooleanAlgebraHomomorphism (A B : BooleanAlgebraPackage) where
  map : A.carrier → B.carrier
  preserve_top : map A.top = B.top
  preserve_bot : map A.bot = B.bot
  preserve_meet : ∀ a b : A.carrier, map (A.meet a b) = B.meet (map a) (map b)
  preserve_join : ∀ a b : A.carrier, map (A.join a b) = B.join (map a) (map b)
  preserve_complement : ∀ a : A.carrier, map (A.complement a) = B.complement (map a)

def HomomorphismClosed {A B : BooleanAlgebraPackage} (h : BooleanAlgebraHomomorphism A B) : Prop :=
  h.preserve_top ∧ h.preserve_bot ∧ h.preserve_meet ∧ h.preserve_join ∧ h.preserve_complement

theorem homomorphism_closed_from_preserve {A B : BooleanAlgebraPackage} (h : BooleanAlgebraHomomorphism A B) : HomomorphismClosed h :=
  And.intro h.preserve_top (And.intro h.preserve_bot (And.intro h.preserve_meet (And.intro h.preserve_join h.preserve_complement)))

end LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse