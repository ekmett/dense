{-# language TypeFamilies #-}
{-# language PatternSynonyms #-}
{-# language MultiParamTypeClasses #-}
{-# language TypeSynonymInstances #-}

module V2
  ( V2(V2, V2_)
  , T
  ) where

import Control.Lens
import Dense.Vector
import qualified Linear.V2 as Linear
import qualified T

type T = V2 -- for bootstrapping matrices

type instance Elem V2 = T.T

data V2 = V2_ {-# UNPACK #-} !T.T {-# UNPACK #-} !T.T
-- {-# complete V2 #-}

instance Num V2 where
  V2_ a b + V2_ c d = V2 (a + c) (b + d)

instance IsV2 V2 where
  _V2 = iso (\(V2_ a b) -> Linear.V2 a b) (\(Linear.V2 a b) -> V2_ a b) 
instance Field1 V2 V2 T.T T.T where
  _1 f (V2_ x y) = f x <&> \x' -> V2_ x' y

instance Field2 V2 V2 T.T T.T where
  _2 f (V2_ x y) = f y <&> \y' -> V2_ x y'
