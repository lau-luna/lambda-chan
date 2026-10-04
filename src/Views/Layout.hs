{-# LANGUAGE OverloadedStrings #-}

module Views.Layout 
  ( 
    indexTemplate
  ) where

import Data.Text (Text, toLower)
import Control.Monad (forM_)
import Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes as A
import Prelude hiding (head, id, div)

import Domain.Board
import Domain.Boards (allBoards)


renderBoardList :: [Board] -> Html
renderBoardList boards =
  H.div ! class_ "board-list mono" $ do
    forM_ boards $ \board -> do 
      H.a ! href (toValue ("/" <> boardAcronym board)) $ toHtml (renderBoardName board)



footerElems :: [Text]
footerElems = ["Rules", "Contact"]

renderFooterElems :: [Text] -> Html
renderFooterElems elems = 
  H.div ! class_ "footer-box-container mono" $ do
    forM_ elems $ \e -> do
      H.a ! class_ "footer-box" ! href (toValue (toLower e)) $ toHtml e


indexTemplate :: Html
indexTemplate = docTypeHtml $ do
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
                 renderBoardList $ boardsByCategory General allBoards
               div ! class_ "board-box" ! id "boards-tech" $ do
                 h2 "Technology"
                 renderBoardList $ boardsByCategory Tech allBoards
               div ! class_ "board-box" ! id "boards-interests" $ do
                 h2 "Interests"
                 renderBoardList $ boardsByCategory Interests allBoards
               div ! class_ "board-box" ! id "boards-nsfw" $ do
                 h2 "NSFW"
                 renderBoardList $ boardsByCategory NSFW allBoards
      div ! class_ "main-container" $ do
        div ! class_ "solid-header mono" $ do
          h2 "popularThreads :: [Thread]"

      hr
      
      footer $ do
        div ! class_ "solid-header mono" $ do
          h2 "stats :: [(String, Int)]"
        hr
        renderFooterElems footerElems
