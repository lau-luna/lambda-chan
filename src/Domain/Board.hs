module Domain.Board
  ( Board(..)
  ) where

import Domain.Thread
import Data.Text (Text)

data Board = Board 
  { boardId :: Int
  , boardAcronym :: Text
  , boardName :: Text
  , boardSticky :: Thread
  }
