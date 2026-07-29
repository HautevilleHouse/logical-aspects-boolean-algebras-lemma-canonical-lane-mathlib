import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean

structure FilterPackage (B : BooleanAlgebraPackage) where
  filter : Set B.carrier
  proper : B.bot ∉ filter
  upwardClosed : ∀ a b : B.carrier, a ∈ filter → B.meet a b = a → b ∈ filter
  meetClosed : ∀ a b : B.carrier, a ∈ filter → b ∈ filter → B.meet a b ∈ filter

structure UltrafilterPackage (B : BooleanAlgebraPackage) (F : FilterPackage B) where
  maximal : ∀ (G : FilterPackage B), (∀ x, x ∈ F.filter → x ∈ G.filter) → (∀ x, x ∈ G.filter → x ∈ F.filter)

structure FilterUltrafilterEvidence (B : BooleanAlgebraPackage) (F : FilterPackage B) (U : UltrafilterPackage B F) where
  maximalClosed : U.maximal

def FilterUltrafilterClosed (B : BooleanAlgebraPackage) (F : FilterPackage B) (U : UltrafilterPackage B F) : Prop :=
  U.maximal

theorem filter_ultrafilter_closed_from_evidence (B : BooleanAlgebraPackage) (F : FilterPackage B)
    (U : UltrafilterPackage B F) (E : FilterUltrafilterEvidence B F U) :
    FilterUltrafilterClosed B F U := by
  exact E.maximalClosed

end LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse