module Main (main) where

import Lib (exampleWithFile, exampleWithDir)

main :: IO ()
main = do
  putStrLn "Example with hard coded file"
  s <- exampleWithFile
  putStrLn $ fst s ++ ": " ++ snd s

  putStrLn "\nExample with hard coded dir path"
  s <- exampleWithDir -- s :: [String]
  mapM_ (\x -> putStrLn $ fst x ++ ": " ++ snd x) s
  putStrLn "Done"

