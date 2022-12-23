module ChatGpt ( 
    GptResponse, 
    query
) where

import qualified Data.ByteString as S
import qualified Data.Aeson.Key as K (fromString)
import Network.HTTP.Client
import Network.HTTP.Types.Status (statusCode)
import Data.ByteString.UTF8 (fromString)
import Data.CaseInsensitive (CI, mk)
import Data.Aeson (object, (.=), encode)

import Data.Text (Text, pack)

data GptResponse = Success String | Error String deriving (Show)

query :: Manager -> String -> String -> IO GptResponse
query manager apiKey prompt = do
    parsedRequest <- parseRequest "https://api.openai.com/v1/completions"

    let requestObject = object [ K.fromString "model" .= (pack "text-davinci-003" :: Text), K.fromString "prompt"  .= (pack prompt :: Text), K.fromString "max_tokens" .= (256 :: Int), K.fromString "temperature" .= (0.7 :: Float) ]

    let request = parsedRequest { 
        method = fromString "POST",
        requestHeaders = [
            (mk $ fromString "Content-Type", fromString "application/json"),
            (mk $ fromString "Authorization", fromString ("Bearer " ++ apiKey))
        ],
        requestBody = RequestBodyLBS $ encode requestObject
    }

    response <- httpLbs request manager    

    return $ Error (show response)