import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean

structure BooleanAlgebraAxioms where
  carrier : Type u
  top : carrier
  bot : carrier
  meet : carrier → carrier → carrier
  join : carrier → carrier → carrier
  complement : carrier → carrier
  meet_comm : ∀ a b : carrier, meet a b = meet b a
  join_comm : ∀ a b : carrier, join a b = join b a
  meet_assoc : ∀ a b c : carrier, meet (meet a b) c = meet a (meet b c)
  join_assoc : ∀ a b c : carrier, join (join a b) c = join a (join b c)
  meet_absorb_join : ∀ a b : carrier, meet a (join a b) = a
  join_absorb_meet : ∀ a b : carrier, join a (meet a b) = a
  complement_meet : ∀ a : carrier, meet a (complement a) = bot
  complement_join : ∀ a : carrier, join a (complement a) = top

def BooleanAlgebraAxiomsClosed (B : BooleanAlgebraAxioms) : Prop :=
  (∀ a b : B.carrier, B.meet_comm a b) ∧ (∀ a b : B.carrier, B.join_comm a b) ∧
  (∀ a b c : B.carrier, B.meet_assoc a b c) ∧ (∀ a b c : B.carrier, B.join_assoc a b c) ∧
  (∀ a b : B.carrier, B.meet_absorb_join a b) ∧ (∀ a b : B.carrier, B.join_absorb_meet a b) ∧
  (∀ a : B.carrier, B.complement_meet a) ∧ (∀ a : B.carrier, B.complement_join a)

end LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse