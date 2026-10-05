module Controllers.Index (show) where

import Prelude hiding (show)
import Web.Scotty (ActionM, html)
import Text.Blaze.Html.Renderer.Text (renderHtml)

-- Data
import Domain.Boards (allBoards) 
import Mock.Data (mockThreads, mockPosts)

import Domain.Board
import Domain.Thread (Thread(..), popularThreads)
import Views.IndexView (indexTemplate)

show :: ActionM()
show = do
  let generalBoards  = boardsByCategory General allBoards
      techBoards     = boardsByCategory Tech allBoards
      interestBoards = boardsByCategory Interests allBoards
      nsfwBoards     = boardsByCategory NSFW allBoards
      popThreads = popularThreads mockThreads
      popThreadsWithBoardNames =
        [(t, boardNameFor (threadBoardId t) allBoards) | t <- popThreads]

  html $ renderHtml $ indexTemplate
    generalBoards
    techBoards
    interestBoards
    nsfwBoards
    popThreadsWithBoardNames
