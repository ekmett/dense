{-# language TypeFamilies #-}
{-# language PatternSynonyms #-}
{-# language MultiParamTypeClasses #-}
{-# language TypeSynonymInstances #-}

module V3 
  ( V3(V3, V3_)
  , T
  ) where

import Control.Lens
import Dense.Vector
import qualified Linear.V3 as Linear
import qualified T

type T = V3 -- for bootstrapping matrices

type instance Elem V3 = T.T

data V3 = V3_ {-# UNPACK #-} !T.T {-# UNPACK #-} !T.T {-# UNPACK #-} !T.T

instance Num V3 where
  V3_ a b c + V3_ d e f = V3_ (a + d) (b + e) (c + f)

instance IsV3 V3 where
  _V3 = iso (\(V3_ a b c) -> Linear.V3 a b c) (\(Linear.V3 a b c) -> V3_ a b c) 
  
instance Field1 V3 V3 T.T T.T where
  _1 f (V3_ x y z) = f x <&> \x' -> V3_ x' y z

instance Field2 V3 V3 T.T T.T where
  _2 f (V3_ x y z) = f y <&> \y' -> V3_ x y' z

instance Field3 V3 V3 T.T T.T where
  _3 f (V3_ x y z) = f z <&> \z' -> V3_ x y z'

