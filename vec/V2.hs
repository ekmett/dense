module V2 where

import qualified T

type T = V2
type Elem = T.T
data V2 = V2 {-# UNPACK #-} !Elem {-# UNPACK #-} !Elem

instance Num V2 where
  V2 a b + V2 c d = V2 (a + c) (b + d)

{-
instance Field1 V2 V2 Elem Elem where
  _1 f (V2 x y) = f x <&> \x' -> V2 x' y

instance Field2 V2 V2 Elem Elem where
  _1 f (V2 x y) = f y <&> \y' -> V2 x y'
-}

