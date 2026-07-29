import canonicalLaneMathlib.AdmissibleClass
import LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean.BooleanAlgebraStructure
import LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean.StoneRepresentation

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean

structure DualityPackage (α : Type u) (B : BooleanAlgebra α) where
  dualAlgebra : BooleanAlgebra α
  dualInvolution : BooleanAlgebraHomomorphism α α B dualAlgebra
  dualInvolutionInvolutive : ∀ a : α, dualInvolution.map (dualInvolution.map a) = a
  doubleNegation : ∀ a : α, B.comp (B.comp a) = a

structure DualityEvidence {α : Type u} {B : BooleanAlgebra α} (D : DualityPackage α B) where
  dualInvolutionInvolutive_closed : D.dualInvolutionInvolutive
  doubleNegation_closed : D.doubleNegation

def DualityClosed {α : Type u} {B : BooleanAlgebra α} (D : DualityPackage α B) : Prop :=
  D.dualInvolutionInvolutive ∧ D.doubleNegation

theorem duality_closed_from_evidence {α : Type u} {B : BooleanAlgebra α} (D : DualityPackage α B) (E : DualityEvidence D) : DualityClosed D := by
  exact And.intro E.dualInvolutionInvolutive_closed E.doubleNegation_closed

end LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse