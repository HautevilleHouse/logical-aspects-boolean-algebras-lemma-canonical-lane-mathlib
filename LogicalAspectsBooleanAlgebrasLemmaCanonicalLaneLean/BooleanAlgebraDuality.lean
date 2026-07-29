import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean.BooleanAlgebraStructure
import HautevilleHouse.LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean.StoneRepresentation
import HautevilleHouse.LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean.BooleanAlgebraHomomorphisms

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean

structure DualityPackage (B : BooleanAlgebraPackage) (S : StoneRepresentationPackage B) where
  dualSpace : Type u
  dualTopology : TopologicalSpace dualSpace
  dualStoneCompact : CompactSpace dualSpace
  dualStoneTotDisc : TotallyDisconnectedSpace dualSpace
  dualStoneT2 : T2Space dualSpace
  dualMap : BooleanAlgebraHomomorphism B (clopenAlgebra dualSpace)
  dualMap_bijective : Function.Bijective dualMap.map

def DualityClosed {B : BooleanAlgebraPackage} {S : StoneRepresentationPackage B} (D : DualityPackage B S) : Prop :=
  HomomorphismClosed D.dualMap ∧ D.dualMap_bijective

theorem duality_closed {B : BooleanAlgebraPackage} {S : StoneRepresentationPackage B} (D : DualityPackage B S) : DualityClosed D :=
  And.intro (homomorphism_closed_from_preserve D.dualMap) D.dualMap_bijective

end LogicalAspectsBooleanAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse