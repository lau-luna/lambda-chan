{-# LANGUAGE OverloadedStrings #-}

module Domain.Thread
  ( Thread(..)
  , recentThreads
  , popularThreads
  , collapsedThreadTitle
  , collapsedThreadText
  ) where

import qualified Data.Text as T
import Data.Time (UTCTime)
import Data.List (sortOn)
import Data.Ord (Down(..))
import Domain.Attachment (Attachment)

-- TODO: Future type safety:
-- Threads should be Thread | ClosedThread
-- ClosedThreads should not accept new Post linked to them

data Thread = Thread 
  { threadId :: Int
  , threadBoardId :: Int
  , threadTitle :: T.Text
  , threadText :: T.Text
  , threadAttachment :: Attachment
  , threadCreatedAt :: UTCTime
  , threadBumpedAt :: UTCTime
  }

recentThreads :: Int -> [Thread] -> [Thread]
recentThreads n = take n . sortOn (Down . threadBumpedAt)

popularThreads :: [Thread] -> [Thread]
popularThreads = recentThreads 8

collapsedText :: Int -> T.Text -> T.Text
collapsedText n t = T.take n t <> ".."

collapsedThreadTitle :: Thread -> T.Text
collapsedThreadTitle t = collapsedText 100 (threadTitle t) 

collapsedThreadText :: Thread -> T.Text
collapsedThreadText t = collapsedText 200 (threadText t)
