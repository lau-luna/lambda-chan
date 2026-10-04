module Domain.Thread
  ( Thread(..)
  ) where

import Data.Text (Text)
import Data.Time (UTCTime)
import Domain.Attachment (Attachment)

-- TODO: Future type safety:
-- Threads should be Thread | ClosedThread
-- ClosedThreads should not accept new Post linked to them

data Thread = Thread 
  { threadId :: Int
  , threadBoardId :: Int
  , threadTitle :: Text
  , threadText :: Text
  , threadAttachment :: Attachment
  , threadCreatedAt :: UTCTime
  , threadBumpedAt :: UTCTime
  }
