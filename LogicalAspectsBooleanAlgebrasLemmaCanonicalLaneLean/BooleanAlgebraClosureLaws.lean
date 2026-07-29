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
  meetAssociative : ∀ a b c : carrier, meet (meet a b) c = meet a (meet b c)
  joinAssociative : ∀ a b c : carrier, join (join a b) c = join a (join b c)
  meetCommutative : ∀ a b : carrier, meet a b = meet b a
  joinCommutative : ∀ a b : carrier, join a b = join b a
  meetDistributive : ∀ a b c : carrier, meet a (join b c) = join (meet a b) (meet a c)
  joinDistributive : ∀ a b c : carrier, join a (meet b c) = meet (join a b) (join a c)
  meetAbsorption : ∀ a b : carrier, meet a (join a b) = a
  joinAbsorption : ∀ a b : carrier, join a (meet a b) = a
  meetIdempotent : ∀ a : carrier, meet a a = a
  joinIdempotent : ∀ a : carrier, join a a = a
  complementMeet : ∀ a : carrier, meet a (complement a) = bot
  complementJoin : ∀ a : carrier, join a (complement a) = top
  topMeet : ∀ a : carrier, meet a top = a
  botJoin : ∀ a : carrier, join a bot = a
  topJoin : ∀ a : carrier, join a top = top
  botMeet : ∀ a : carrier, meet a bot = bot

structure BooleanAlgebraEvidence (B : BooleanAlgebraPackage) where
  meetAssociativeClosed : B.meetAssociative
  joinAssociativeClosed : B.joinAssociative
  meetCommutativeClosed : B.meetCommutative
  joinCommutativeClosed : B.joinCommutative
  meetDistributiveClosed : B.meetDistributive
  joinDistributiveClosed : B.joinDistributive
  meetAbsorptionClosed : B.meetAbsorption
  joinAbsorptionClosed : B.joinAbsorption
  meetIdempotentClosed : B.meetIdempotent
  joinIdempotentClosed : B.joinIdempotent
  complementMeetClosed : B.complementMeet
  complementJoinClosed : B.complementJoin
  topMeetClosed : B.topMeet
  botJoinClosed : B.botJoin
  topJoinClosed : B.topJoin
  botMeetClosed : B.botMeet

def BooleanAlgebraClosed (B : BooleanAlgebraPackage) : Prop :=
  B.meetAssociative ∧ B.joinAssociative ∧ B.meetCommutative ∧ B.joinCommutative ∧
  B.meetDistributive ∧ B.joinDistributive ∧ B.meetAbsorption ∧ B.joinAbsorption ∧
  B.meetIdempotent ∧ B.joinIdempotent ∧ B.complementMeet ∧ B.complementJoin ∧
  B.topMeet ∧ B.botJoin ∧ B.topJoin ∧ B.botMeet

theorem boolean_algebra_closed_from_evidence (B : BooleanAlgebraPackage)
    (E : BooleanAlgebraEvidence B) : BooleanAlgebraClosed B := by
  exact And.intro E.meetAssociativeClosed
    (And.intro E.joinAssociativeClosed
      (And.intro E.meetCommutativeClosed
        (And.intro E.joinCommutativeClosed
          (And.intro E.meetDistributiveClosed
            (And.intro E.joinDistributiveClosed
              (And.intro E.meetAbsorptionClosed
                (And.intro E.joinAbsorptionClosed
                  (And.intro E.meetIdempotentClosed
                    (And.intro E.joinIdempotentClosed
                      (And.intro E.complementMeetClosed
                        (And.intro E.complementJoinClosed
                          (And.intro E.topMeetClosed
                            (And.intro E.botJoinClosed
                              (And.intro E.topJoinClosed E.botMeetClosed)))))))))))))))

end LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse