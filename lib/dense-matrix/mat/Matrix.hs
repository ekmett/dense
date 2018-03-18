{-# language PatternSynonyms #-}
module Matrix 
  ( M22, pattern M22
  , M23, pattern M23
  , M32
  , M33
  , T.T
  , V2.V2
  , V3.V3
  -- , V22, V23, V32, V33
  ) where

-- import Dense.Vector
import T
import V2
import V3
import V22
import V23
import V32
import V33

type M22 = V22.T
type M23 = V23.T
type M32 = V32.T
type M33 = V33.T

pattern M22 :: T.T -> T.T -> T.T -> T.T -> M22
pattern M22 a b c d = V22.V2_ (V2.V2_ a b) (V2.V2_ c d)
-- {-# complete_patterns M22 #-}

pattern M23 :: T.T -> T.T -> T.T -> T.T -> T.T -> T.T -> M23
pattern M23 a b c d e f = V23.V2_ (V3.V3_ a b c) (V3.V3_ d e f)
-- {-# complete_patterns M23 #-}
