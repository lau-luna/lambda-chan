{-# LANGUAGE OverloadedStrings #-}

module Domain.Board
  ( Board(..)
  , BoardCategory(..)
  , boardsByCategory
  , renderBoardName
  , boardPath
  , findBoard
  , boardNameFor
  ) where

import Domain.Thread
import Data.Text (Text)
import Data.List (find)

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

boardPath :: Board -> Text
boardPath b = "/" <> boardAcronym b <> "/"

renderBoardName :: Board -> Text
renderBoardName b = "/" <> boardAcronym b <> "/ " <> boardName b

findBoard :: Int -> [Board] -> Maybe Board
findBoard bid = find (\b -> boardId b == bid)

boardNameFor :: Int -> [Board] -> Maybe Text 
boardNameFor bid boards = boardName <$> findBoard bid boards
