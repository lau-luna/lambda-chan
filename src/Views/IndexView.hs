{-# LANGUAGE OverloadedStrings #-}

module Views.IndexView 
  ( 
    indexTemplate
  ) where

import Data.Text (Text, toLower)
import Control.Monad (forM_)
import Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes as A
import Prelude hiding (head, id, div)

import Domain.Board
import Domain.Thread

renderBoardList :: [Board] -> Html
renderBoardList boards =
  H.div ! class_ "board-list mono" $ do
    forM_ boards $ \board -> do 
      H.a ! href (toValue ("/" <> boardAcronym board)) $ toHtml (renderBoardName board)

renderThreadPreview :: (Thread, Maybe Board) -> Html
renderThreadPreview (t, Nothing) = do
  h3 . toHtml $ threadTitle t
renderThreadPreview (t, Just board) = do
  div ! class_ "thread-preview" $ do
    a ! href (toValue (boardPath board)) ! class_ "board-name mono" $ toHtml (boardName board)
    img ! src (toValue (threadAttachmentPath t))
    h3 ! class_ "thread-title" $ toHtml (collapsedThreadTitle t)
    p ! class_ "thread-text" $ toHtml (collapsedThreadText t)


footerElems :: [Text]
footerElems = ["Rules", "Contact"]

renderFooterElems :: [Text] -> Html
renderFooterElems elems = 
  H.div ! class_ "footer-box-container mono" $ do
    forM_ elems $ \e -> do
      H.a ! class_ "footer-box" ! href (toValue (toLower e)) $ toHtml e


indexTemplate :: [Board] -> [Board] -> [Board] -> [Board] -> [(Thread, Maybe Board)] -> Html
indexTemplate general tech interests nsfw popularThreads = docTypeHtml $ do
  H.head $ do
    H.meta ! A.charset "utf-8"
    H.title "λ-chan"
    H.link ! rel "stylesheet" ! href "/css/main-style.css"
  body $ do
    header ! class_ ".mono" $ do
      h1 ! class_ "site-title" $ "λ-chan"

    div ! class_ "container" $ do
      div ! class_ "reisen-boards" $ do
        img ! src "/img/reisen-cut-ear.png"
        div ! class_ "welcome-container" $ do
          h1 "Welcome to λ-chan"
          p "λ-chan is an open-source imageboard written in Haskell... blablabla tengo que seguirlo"
          div ! class_ "boards-container" $ do
            div ! class_ "mono" $ do
              h2 $ do
                H.span ! class_ "green" $ "lambdaChan"
                H.span ! class_ "fuchsia" $ " :: "
                H.span "["
                H.span ! class_ "light-blue" $ em "Board"
                H.span "]"

            div ! class_ "board-box-container" $ do
               div ! class_ "board-box" ! id "boards-general" $ do
                 h2 "General"
                 renderBoardList general
               div ! class_ "board-box" ! id "boards-tech" $ do
                 h2 "Technology"
                 renderBoardList tech 
               div ! class_ "board-box" ! id "boards-interests" $ do
                 h2 "Interests"
                 renderBoardList interests 
               div ! class_ "board-box" ! id "boards-nsfw" $ do
                 h2 "NSFW"
                 renderBoardList nsfw
      div ! class_ "main-container" $ do
        div ! class_ "solid-header mono" $ do
          h2 "popularThreads :: [Thread]"
        div ! class_ "popular-threads" $ do
          forM_ popularThreads $ \t -> do
              renderThreadPreview t

      hr
      
      footer $ do
        div ! class_ "solid-header mono" $ do
          h2 "stats :: [(String, Int)]"
        hr
        renderFooterElems footerElems
