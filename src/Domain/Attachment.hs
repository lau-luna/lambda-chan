module Domain.Attachment 
  ( Attachment(..)
  , Image(..)
  , Video(..)
  , Gif(..)
  , attachmentPath
  ) where

import Data.Text (Text)

data Attachment = 
  NoAttachment 
  | ImageFile Image 
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

attachmentPath :: Attachment -> Maybe Text
attachmentPath NoAttachment  = Nothing
attachmentPath (ImageFile i) = Just $ imagePath i
attachmentPath (VideoFile i) = Just $ videoPath i
attachmentPath (GifFile i)   = Just $ gifPath i
