module Main (main) where

import System.Environment
import Data.List (intercalate)
import Network.HTTP.Client
import Network.HTTP.Client.TLS
import System.IO
import ChatGpt
import Data.Char (isSpace)

main :: IO ()
main = do
  args <- getArgs
  apiKey <- getEnv "OPENAI_KEY"
  manager <- newManager tlsManagerSettings
  response <- query manager apiKey "generate random word" -- $ intercalate " " args
  putStrLn $ show response