{-# LANGUAGE OverloadedStrings #-}

module Domain.Thread
  ( Thread(..)
  , recentThreads
  , popularThreads
  , collapsedThreadTitle
  , collapsedThreadText
  , threadAttachmentPath
  ) where

import qualified Data.Text as T
import Data.Time (UTCTime)
import Data.List (sortOn)
import Data.Ord (Down(..))

import Domain.Attachment

-- TODO: Future type safety:
-- Threads should be Thread | ClosedThread
-- ClosedThreads should not accept new Post linked to them

data Thread = Thread 
  { threadId :: Int
  , threadBoardId :: Int
  , threadTitle :: T.Text
  , threadText :: T.Text
  , threadAttachment :: MediaAttachment 
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
collapsedThreadTitle t
  | T.length title > 100 = collapsedText 100 title 
  | otherwise            = title
  where title = threadTitle t

collapsedThreadText :: Thread -> T.Text
collapsedThreadText t
  | T.length text > 200 = collapsedText 200 (threadText t)
  | otherwise  = text
  where text = threadText t

threadAttachmentPath :: Thread -> T.Text
threadAttachmentPath t = mediaPath $ threadAttachment t
