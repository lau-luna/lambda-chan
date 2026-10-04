{-# LANGUAGE OverloadedStrings #-}


module Main (main) where

import Web.Scotty
import Network.Wai.Middleware.Static
import Text.Blaze.Html.Renderer.Text (renderHtml)

import Data.Monoid (mconcat)
import Data.Time (getCurrentTime, UTCTime)
import Data.Text (Text)

import Views.Layout (indexTemplate)

main :: IO ()
main = scotty 3000 $ do
  middleware (staticPolicy (noDots >-> addBase "static"))

  get "/" $ do
    html $ renderHtml indexTemplate
