import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean

structure BooleanAlgebraPackage where
  carrier : Type u
  top : carrier
  bot : carrier
  meet : carrier → carrier → carrier
  join : carrier → carrier → carrier
  complement : carrier → carrier
  meet_assoc : ∀ a b c : carrier, meet (meet a b) c = meet a (meet b c)
  join_assoc : ∀ a b c : carrier, join (join a b) c = join a (join b c)
  meet_comm : ∀ a b : carrier, meet a b = meet b a
  join_comm : ∀ a b : carrier, join a b = join b a
  meet_absorb : ∀ a b : carrier, meet a (join a b) = a
  join_absorb : ∀ a b : carrier, join a (meet a b) = a
  top_meet : ∀ a : carrier, meet a top = a
  bot_join : ∀ a : carrier, join a bot = a
  complement_meet : ∀ a : carrier, meet a (complement a) = bot
  complement_join : ∀ a : carrier, join a (complement a) = top

def BooleanAlgebraClosed (B : BooleanAlgebraPackage) : Prop :=
  B.meet_assoc ∧ B.join_assoc ∧ B.meet_comm ∧ B.join_comm ∧
  B.meet_absorb ∧ B.join_absorb ∧ B.top_meet ∧ B.bot_join ∧
  B.complement_meet ∧ B.complement_join

end LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse