import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean.BooleanAlgebraStructure
import HautevilleHouse.LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean.BooleanAlgebraHomomorphisms

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean

structure CompletionPackage (B : BooleanAlgebraPackage) where
  completion : BooleanAlgebraPackage
  embedding : BooleanAlgebraHomomorphism B completion
  embedding_injective : Function.Injective embedding.map
  embedding_preserves_sup : ∀ (S : Set B.carrier), embedding.map (sup S) = completion.join (Set.image embedding.map S)
  completion_is_complete : ∀ (T : Set completion.carrier), ∃ s : completion.carrier, s = completion.join T

def CompletionClosed {B : BooleanAlgebraPackage} (C : CompletionPackage B) : Prop :=
  HomomorphismClosed C.embedding ∧ C.embedding_injective ∧ C.embedding_preserves_sup ∧ C.completion_is_complete

theorem completion_closed {B : BooleanAlgebraPackage} (C : CompletionPackage B) : CompletionClosed C :=
  And.intro (homomorphism_closed_from_preserve C.embedding) (And.intro C.embedding_injective (And.intro C.embedding_preserves_sup C.completion_is_complete))

end LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse