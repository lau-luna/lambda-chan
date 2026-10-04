{-# LANGUAGE OverloadedStrings #-}

module Views.Layout 
  ( 
    indexTemplate
  ) where


import Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes as A
import Prelude hiding (head, id, div)

boardsGeneral :: Html
boardsGeneral =
  H.div ! class_ "board-list mono" $ do
    H.a ! href "/b" $ "/b/ Random"
    H.a ! href "/hu" $ "/hu/ Humanity"
    H.a ! href "/wv)" $ "/wv/ Worksafe Videos"

boardsInterests :: Html
boardsInterests =
  H.div ! class_ "board-list mono" $ do
    H.a ! href "" $ "/a/ Anime & Manga"
    H.a ! href "" $ "/v/ Videogames"
    H.a ! href "" $ "/i/ Other Interests"

boardsTech :: Html
boardsTech =
  H.div ! class_ "board-list mono" $ do
    H.a ! href "" $ "/t/ Tech General"
    H.a ! href "" $ "/l/ Linux"
    H.a ! href "" $ "/c/ Computer Science"
    H.a ! href "" $ "/p/ Programming"
    H.a ! href "" $ "/fp/ Functional Programming"

boardsNSFW :: Html
boardsNSFW =
  H.div ! class_ "board-list mono" $ do
    H.a $ "/h/ Hentai"

footerElems :: Html
footerElems = 
  H.div ! class_ "footer-box-container mono" $ do
    H.a ! class_ "footer-box" $ "Rules"
    H.a ! class_ "footer-box" $ "Contact"



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
                 boardsGeneral
               div ! class_ "board-box" ! id "boards-tech" $ do
                 h2 "Technology"
                 boardsTech
               div ! class_ "board-box" ! id "boards-interests" $ do
                 h2 "Interests"
                 boardsInterests
               div ! class_ "board-box" ! id "boards-nsfw" $ do
                 h2 "NSFW"
                 boardsNSFW
      div ! class_ "main-container" $ do
        div ! class_ "solid-header mono" $ do
          h2 "popularThreads :: [Thread]"

      hr
      
      footer $ do
        div ! class_ "solid-header mono" $ do
          h2 "stats :: [(String, Int)]"
        hr
        footerElems
