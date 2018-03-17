module V3 where

import qualified T

type T = V3
type Elem = T.T
data V3 = V3 {-# UNPACK #-} !Elem {-# UNPACK #-} !Elem {-# UNPACK #-} !Elem

instance Num V3 where
  V3 a b c + V3 d e f = V3 (a + d) (b + e) (c + f)

{-
instance Field1 V3 V3 Elem Elem where
  _1 f (V3 x y z) = f x <&> \x' -> V3 x' y z

instance Field2 V3 V3 Elem Elem where
  _1 f (V3 x y z) = f y <&> \y' -> V3 x y' z

instance Field3 V3 V3 Elem Elem where
  _1 f (V3 x y z) = f z <&> \z' -> V3 x y z'
-}

