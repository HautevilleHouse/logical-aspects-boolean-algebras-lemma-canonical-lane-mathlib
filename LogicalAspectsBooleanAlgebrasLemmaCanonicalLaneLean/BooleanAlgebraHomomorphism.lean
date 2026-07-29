import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean.BooleanAlgebraAxioms

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean

structure BooleanAlgebraHomomorphism (A B : BooleanAlgebraAxioms) where
  map : A.carrier → B.carrier
  top_preserved : map A.top = B.top
  bot_preserved : map A.bot = B.bot
  meet_preserved : ∀ a b : A.carrier, map (A.meet a b) = B.meet (map a) (map b)
  join_preserved : ∀ a b : A.carrier, map (A.join a b) = B.join (map a) (map b)
  complement_preserved : ∀ a : A.carrier, map (A.complement a) = B.complement (map a)

def BooleanAlgebraHomomorphismClosed (h : BooleanAlgebraHomomorphism A B) : Prop :=
  h.top_preserved ∧ h.bot_preserved ∧
  (∀ a b, h.meet_preserved a b) ∧ (∀ a b, h.join_preserved a b) ∧
  (∀ a, h.complement_preserved a)

end LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse