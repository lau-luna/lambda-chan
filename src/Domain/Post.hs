module Domain.Post 
  ( Post(..)
  , PostContent(..)
  ) where

import Data.Text (Text)
import Data.Time (UTCTime)
import Domain.Attachment

data PostContent
  = TextOnly Text
  | AttachmentOnly MediaAttachment
  | TextAndAttachment Text MediaAttachment

data Post = Post
  { postId        :: Int
  , postThreadId  :: Int
  , postContent   :: PostContent
  , postCreatedAt :: UTCTime
  }
