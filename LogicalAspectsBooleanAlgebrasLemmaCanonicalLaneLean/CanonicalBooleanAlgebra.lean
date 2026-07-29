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
  meetCommutative : ∀ a b : carrier, meet a b = meet b a
  joinCommutative : ∀ a b : carrier, join a b = join b a
  meetAssociative : ∀ a b c : carrier, meet (meet a b) c = meet a (meet b c)
  joinAssociative : ∀ a b c : carrier, join (join a b) c = join a (join b c)
  meetAbsorbsJoin : ∀ a b : carrier, meet a (join a b) = a
  joinAbsorbsMeet : ∀ a b : carrier, join a (meet a b) = a
  meetDistributesJoin : ∀ a b c : carrier, meet a (join b c) = join (meet a b) (meet a c)
  joinDistributesMeet : ∀ a b c : carrier, join a (meet b c) = meet (join a b) (join a c)
  complementMeet : ∀ a : carrier, meet a (complement a) = bot
  complementJoin : ∀ a : carrier, join a (complement a) = top
  topMeet : ∀ a : carrier, meet top a = a
  botJoin : ∀ a : carrier, join bot a = a

structure BooleanAlgebraEvidence (B : BooleanAlgebraPackage) where
  meetCommutativeClosed : B.meetCommutative
  joinCommutativeClosed : B.joinCommutative
  meetAssociativeClosed : B.meetAssociative
  joinAssociativeClosed : B.joinAssociative
  meetAbsorbsJoinClosed : B.meetAbsorbsJoin
  joinAbsorbsMeetClosed : B.joinAbsorbsMeet
  meetDistributesJoinClosed : B.meetDistributesJoin
  joinDistributesMeetClosed : B.joinDistributesMeet
  complementMeetClosed : B.complementMeet
  complementJoinClosed : B.complementJoin
  topMeetClosed : B.topMeet
  botJoinClosed : B.botJoin

def CanonicalBooleanAlgebraClosed (B : BooleanAlgebraPackage) : Prop :=
  B.meetCommutative ∧ B.joinCommutative ∧ B.meetAssociative ∧ B.joinAssociative ∧
  B.meetAbsorbsJoin ∧ B.joinAbsorbsMeet ∧ B.meetDistributesJoin ∧ B.joinDistributesMeet ∧
  B.complementMeet ∧ B.complementJoin ∧ B.topMeet ∧ B.botJoin

theorem canonical_boolean_algebra_closed_from_evidence (B : BooleanAlgebraPackage)
    (E : BooleanAlgebraEvidence B) : CanonicalBooleanAlgebraClosed B := by
  exact And.intro E.meetCommutativeClosed
    (And.intro E.joinCommutativeClosed
      (And.intro E.meetAssociativeClosed
        (And.intro E.joinAssociativeClosed
          (And.intro E.meetAbsorbsJoinClosed
            (And.intro E.joinAbsorbsMeetClosed
              (And.intro E.meetDistributesJoinClosed
                (And.intro E.joinDistributesMeetClosed
                  (And.intro E.complementMeetClosed
                    (And.intro E.complementJoinClosed
                      (And.intro E.topMeetClosed E.botJoinClosed))))))))))

end LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse