{-# LANGUAGE OverloadedStrings #-}

module Domain.Board
  ( Board(..)
  , BoardCategory(..)
  , boardsByCategory
  , renderBoardName
  ) where

import Domain.Thread
import Data.Text (Text)

data BoardCategory
  = General
  | Tech
  | Interests
  | NSFW
  deriving (Eq, Show)

data Board = Board 
  { boardId :: Int
  , boardAcronym :: Text
  , boardName :: Text
  , boardCategory :: BoardCategory
  , boardSticky :: Maybe Thread
  }

boardsByCategory :: BoardCategory -> [Board] -> [Board] 
boardsByCategory cat bs = filter (\b -> boardCategory b == cat) bs

renderBoardName :: Board -> Text
renderBoardName b = "/" <> boardAcronym b <> "/ " <> boardName b
