import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean

structure BooleanAlgebraHomomorphism (B C : BooleanAlgebraPackage) where
  toFun : B.carrier → C.carrier
  presTop : toFun B.top = C.top
  presBot : toFun B.bot = C.bot
  presMeet : ∀ a b : B.carrier, toFun (B.meet a b) = C.meet (toFun a) (toFun b)
  presJoin : ∀ a b : B.carrier, toFun (B.join a b) = C.join (toFun a) (toFun b)
  presComplement : ∀ a : B.carrier, toFun (B.complement a) = C.complement (toFun a)

structure HomomorphismEvidence (B C : BooleanAlgebraPackage) (f : BooleanAlgebraHomomorphism B C) where
  presTopClosed : f.presTop
  presBotClosed : f.presBot
  presMeetClosed : f.presMeet
  presJoinClosed : f.presJoin
  presComplementClosed : f.presComplement

def HomomorphismClosed (B C : BooleanAlgebraPackage) (f : BooleanAlgebraHomomorphism B C) : Prop :=
  f.presTop ∧ f.presBot ∧ f.presMeet ∧ f.presJoin ∧ f.presComplement

theorem homomorphism_closed_from_evidence (B C : BooleanAlgebraPackage) (f : BooleanAlgebraHomomorphism B C)
    (E : HomomorphismEvidence B C f) : HomomorphismClosed B C f := by
  exact And.intro E.presTopClosed
    (And.intro E.presBotClosed
      (And.intro E.presMeetClosed
        (And.intro E.presJoinClosed E.presComplementClosed)))

end LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse