import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean

structure BooleanAlgebraObject where
  carrier : Type
  meet : carrier -> carrier -> carrier
  join : carrier -> carrier -> carrier
  complement : carrier -> carrier
  zero : carrier
  one : carrier
  meetAssoc : ∀ a b c : carrier, meet (meet a b) c = meet a (meet b c)
  joinAssoc : ∀ a b c : carrier, join (join a b) c = join a (join b c)
  meetComm : ∀ a b : carrier, meet a b = meet b a
  joinComm : ∀ a b : carrier, join a b = join b a
  absorbMeetJoin : ∀ a b : carrier, meet a (join a b) = a
  absorbJoinMeet : ∀ a b : carrier, join a (meet a b) = a
  meetDistribJoin : ∀ a b c : carrier, meet a (join b c) = join (meet a b) (meet a c)
  joinDistribMeet : ∀ a b c : carrier, join a (meet b c) = meet (join a b) (join a c)
  meetComplement : ∀ a : carrier, meet a (complement a) = zero
  joinComplement : ∀ a : carrier, join a (complement a) = one
  zeroMeet : ∀ a : carrier, meet zero a = zero
  oneJoin : ∀ a : carrier, join one a = one

def BooleanAlgebraModel : Type := BooleanAlgebraObject

structure AdmittedBooleanAlgebra where
  algebra : BooleanAlgebraObject
  homomorphismPreserved : Prop
  conclusion : homomorphismPreserved

def BooleanWitnessClosed (O : AdmittedBooleanAlgebra) : Prop :=
  O.homomorphismPreserved

end LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse