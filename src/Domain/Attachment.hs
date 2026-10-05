module Domain.Attachment 
  ( Attachment(..)
  , MediaAttachment(..)
  , Image(..)
  , Video(..)
  , Gif(..)
  , attachmentPath
  , mediaPath
  ) where

import Data.Text (Text)


data Attachment 
  = NoAttachment 
  | HasAttachment MediaAttachment

data MediaAttachment
  = ImageFile Image
  | VideoFile Video
  | GifFile Gif

data Image = Image 
  { imagePath :: Text
  }

data Video = Video
  { videoPath :: Text
  }

data Gif = Gif
  { gifPath :: Text
  }

mediaPath :: MediaAttachment -> Text
mediaPath (ImageFile i) = imagePath i
mediaPath (VideoFile v) = videoPath v
mediaPath (GifFile g)   = gifPath g

attachmentPath :: Attachment -> Maybe Text
attachmentPath NoAttachment      = Nothing
attachmentPath (HasAttachment m) = Just $ mediaPath m
