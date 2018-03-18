{-# language RankNTypes #-}
{-# language TypeFamilies #-}
{-# language PatternSynonyms #-}
{-# language ViewPatterns #-}
module Dense.Vector where

import Control.Lens
import qualified Linear.V2 as Linear
import qualified Linear.V3 as Linear

type family Elem (t :: *) :: *

class IsV2 t where
  _V2 :: Iso' t (Linear.V2 (Elem t))

pattern V2 :: IsV2 t => Elem t -> Elem t -> t
pattern V2 a b <- (view _V2 -> Linear.V2 a b) where
  V2 a b = _V2 # Linear.V2 a b
-- {-# complete V2 #-} -- let me write this damn it.

-- NB: I can't make the {-# complete V2 #-} pragma polymorphic and supply it here
-- and i can't supply it on the data type, because it doesn't involve a constructor for the damn type
-- {-# complete #-} pragmas are completely worthless

class IsV3 t where
  _V3 :: Iso' t (Linear.V3 (Elem t))

pattern V3 :: IsV3 t => Elem t -> Elem t -> Elem t -> t
pattern V3 a b c <- (view _V3 -> Linear.V3 a b c) where
  V3 a b c = _V3 # Linear.V3 a b c
-- {-# complete V3 #-}
