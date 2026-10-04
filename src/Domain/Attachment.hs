module Domain.Attachment 
  ( Attachment(..)
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

