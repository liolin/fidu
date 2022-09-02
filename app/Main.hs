module Main (main) where

import qualified Data.ByteString as B
import qualified Crypto.Hash.SHA256 as SHA256
import Data.Digest.Pure.SHA
import qualified Data.Ascii.Word8 as C
import Lib

main :: IO ()
main = do
  s <- example
  putStrLn s

