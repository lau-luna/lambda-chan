{-# LANGUAGE OverloadedStrings #-}

module Main (main) where

import Web.Scotty
import Network.Wai.Middleware.Static

import Data.List (stripPrefix)

import qualified Controllers.Index as Index

main :: IO ()
main = scotty 3000 $ do
  middleware (staticPolicy (noDots >-> addBase "static"))
  middleware (staticPolicy (policy stripUploads >-> addBase "uploads"))

  get "/" Index.show

stripUploads :: String -> Maybe String
stripUploads path = stripPrefix "uploads/" path
