{-# LANGUAGE  DeriveGeneric #-}

module Types where

import GHC.Generics
import Data.Aeson (FromJSON, ToJSON)

data Employee = Employee
  {firstName :: String
  ,lastName :: String
  ,email :: String
  ,department :: Department
  } deriving (Show, Generic)

data Department = Department
  {code :: String
  , name :: String
  , description :: String
  } deriving (Show, Generic)

data Project = Project
  {title :: String
  , duration :: Int
  } deriving (Show, Generic)

instance ToJSON Employee
instance ToJSON Department
instance ToJSON Project
instance FromJSON Employee
instance FromJSON Department
instance FromJSON Project