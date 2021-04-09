{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE  DeriveGeneric #-}

module Main where

import Network.Wai.Middleware.Cors
import Web.Scotty
import Data.Aeson (FromJSON, ToJSON)
import GHC.Generics
import Types

import qualified Data.Text.Lazy as L
import qualified Example as E

main :: IO ()
main = do -- IO Monad
  putStrLn "Starting Server at port 4711 ..."
  scotty 4711 $ do -- ScottyM Monad
    middleware $ cors (const $ Just appCorsResourcePolicy)
    get "/hello" $ do -- ActionM
      text "Hello World"
    get "/hello/:name" $ do
      name <- param "name"
      text $ L.pack ("Hello " ++ name ++ "!")

    get "/department" (json E.d1)

    post "/department" $ do
      department5 <- jsonData :: ActionM Department --jsonData must know what type to be used
      json department5

    get "/employee" $ do
      json E.e1
    post "/employee/add" $ do
      employee <- jsonData :: ActionM Employee
      text $ L.pack ("{\"msg\":\"Employee was saved: " ++ (firstName employee) ++ "!\"}")


appCorsResourcePolicy :: CorsResourcePolicy
appCorsResourcePolicy =
    simpleCorsResourcePolicy
        { corsMethods = ["GET", "POST"]
        , corsRequestHeaders = ["Authorization", "Content-Type"]
        }