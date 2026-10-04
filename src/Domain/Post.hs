module Domain.Post 
  ( Post(..)

  ) where

import Data.Text (Text)
import Data.Time (UTCTime)
import Domain.Attachment

data Post = Post 
  { postId :: Int
  , postThreadId :: Int
  , postText :: Text
  , postFile :: Attachment
  , postCreatedAt :: UTCTime
  }

