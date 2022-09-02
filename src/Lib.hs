module Lib
    ( exampleWithFile
    , exampleWithDir
    ) where

import qualified Data.ByteString.Lazy as B
import Data.Digest.Pure.SHA
import System.Directory (listDirectory)
import Data.List (isInfixOf)
import System.Posix.Internals (newFilePath)


exampleWithFile :: IO (FilePath, String)
exampleWithFile = do
  hash <- sha256Integer <$> B.readFile exampleFile
  return (exampleFile, hash)

exampleWithDir :: IO [(FilePath, String)]
exampleWithDir = do
  files <- getPaths exampleDir -- files :: [FilePath]
  content <- traverse B.readFile files
  return $ zip files (sha256Integer <$> content)

exampleFile :: String
exampleFile = "/home/liolin/code/fidu/arch.jpg" 

exampleDir :: String
exampleDir = "/home/liolin/code/fidu"

sha256Integer :: B.ByteString -> String
sha256Integer = showDigest . sha256

getPaths :: FilePath -> IO [FilePath]
getPaths path = do
  allFiles <- listDirectory path
  let jpgFiles = filter (isInfixOf ".jpg") allFiles
      paths = map ((path ++ "/") ++) jpgFiles
  return paths
