module Lib
    ( example
    ) where

import qualified Data.ByteString.Lazy as B
import Data.Digest.Pure.SHA


example :: IO String
example = fmap blub openExampleFile

blub :: B.ByteString -> String
blub = showDigest . sha256


openExampleFile :: IO B.ByteString
openExampleFile =  B.readFile "/home/liolin/code/fidu/arch.jpg"

