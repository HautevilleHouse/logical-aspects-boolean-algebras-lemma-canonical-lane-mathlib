import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean.BooleanAlgebraStructure

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean

structure FilterPackage (B : BooleanAlgebraPackage) where
  carrier : Set B.carrier
  nonempty : carrier.Nonempty
  upward_closed : ∀ a b : B.carrier, a ∈ carrier → B.meet a b = a → b ∈ carrier
  meet_stable : ∀ a b : B.carrier, a ∈ carrier → b ∈ carrier → B.meet a b ∈ carrier

def FilterClosed {B : BooleanAlgebraPackage} (F : FilterPackage B) : Prop :=
  F.nonempty ∧ F.upward_closed ∧ F.meet_stable

theorem filter_closed_from_properties {B : BooleanAlgebraPackage} (F : FilterPackage B) : FilterClosed F :=
  And.intro F.nonempty (And.intro F.upward_closed F.meet_stable)

structure UltrafilterPackage (B : BooleanAlgebraPackage) extends FilterPackage B where
  maximal : ∀ (F' : FilterPackage B), FilterClosed F' → carrier ⊆ F'.carrier → F'.carrier = carrier

def UltrafilterClosed {B : BooleanAlgebraPackage} (U : UltrafilterPackage B) : Prop :=
  FilterClosed U.toFilterPackage ∧ U.maximal

theorem ultrafilter_closed_from_properties {B : BooleanAlgebraPackage} (U : UltrafilterPackage B) : UltrafilterClosed U :=
  And.intro (filter_closed_from_properties U.toFilterPackage) U.maximal

end LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse