{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module Main where

import Data.Monoid ((<>))
import Data.Aeson (FromJSON, ToJSON)
import GHC.Generics
import Web.Scotty
import Database.PostgreSQL.Simple
import Database.PostgreSQL.Simple.FromRow
import Database.PostgreSQL.Simple.ToRow
import Database.PostgreSQL.Simple.ToField
import Control.Monad
import Control.Applicative
import Database.PostgreSQL.Simple.URL
import Control.Monad.IO.Class
import Data.Text.Lazy.Encoding (decodeUtf8)

import System.Environment

data Menu = Menu { idMenu :: Maybe Int, name :: Maybe String, description :: Maybe String, price :: Maybe Int, restaurant :: Maybe Int } deriving (Show,Generic)
instance ToJSON Menu
instance FromJSON Menu

matchesId :: Int -> Menu -> Bool
matchesId id menu = case idMenu menu of
        Nothing -> False
       


instance FromRow Menu where
  fromRow = Menu <$> field <*> field <*> field <*> field <*> field
  
  
instance ToRow Menu where
    toRow d = [toField (idMenu d), toField (name d), toField (description d), toField (price d), toField (restaurant d)]
    

getAllMenus :: Connection -> IO [Menu]
getAllMenus c = do
  list <- (query_ c "select * from menu" :: IO [Menu])
  return list    
    

main = do
  putStrLn "Starting Server..."
  conn <- connectPostgreSQL  "postgres://tnymbcesgsavlj:w64hzXF9XV63blQATIr5bHxj4G@ec2-54-243-203-93.compute-1.amazonaws.com:5432/dch4plt165gtm"
  env <- getEnvironment
  let port = maybe 8080 read $ lookup "PORT" env
  scotty port $ do
     
    get "/" $ do
      text ("Bienvenido a un servicio REST construido con Haskell, ingrese a /menus para ver la lista de menus")

    get "/menus" $ do
      variable <- liftIO (getAllMenus conn)
      json variable

    get "/menus/:id" $ do
      id <- param "id"
      allMenus <- liftIO (getAllMenus conn)
      json (filter (matchesId id) allMenus)
      
    post "/menus" $ do
      menu <- (jsonData :: ActionM Menu)
      response <- liftIO (execute conn "insert into menu (name,description,price,restaurant) values (?,?,?,?)" ((name menu), (description menu), (price menu),(restaurant menu)))
      json (menu)
                     

