{-# LANGUAGE OverloadedStrings #-}

module Mock.Data
  ( mockThreads
  , mockPosts
  ) where

import qualified Domain.Attachment as Att
import Domain.Boards (allBoards)
import Domain.Post
import Domain.Thread

import Data.Time (UTCTime(..), fromGregorian, secondsToDiffTime)


-- Mock Data
mockTime1, mockTime2, mockTime3 :: UTCTime
mockTime1 = UTCTime (fromGregorian 2026 10 1) (secondsToDiffTime 36000)
mockTime2 = UTCTime (fromGregorian 2026 10 3) (secondsToDiffTime 43200)
mockTime3 = UTCTime (fromGregorian 2026 10 4) (secondsToDiffTime 10800)

-- Attachments Examples
mockImage1, mockImage2, mockImage3 :: Att.Image
mockImage1 = Att.Image { Att.imagePath = "/mock-uploads/img/haskell-purescript.png" }
mockImage2 = Att.Image { Att.imagePath = "/mock-uploads/img/opsec-chan.jpg" }
mockImage3 = Att.Image { Att.imagePath = "/mock-uploads/img/rei-ayanami.jpg" }

mockGif :: Att.Gif
mockGif = Att.Gif { Att.gifPath = "/mock-uploads/gif/reisen.gif" }

mockThreads :: [Thread]
mockThreads =
  [ Thread
      { threadId = 1
      , threadBoardId = 1  -- /b/
      , threadTitle = "Welcome to /b/"
      , threadText = "Basic rules, read before posting."
      , threadAttachment = Att.ImageFile mockImage2  -- opsec-chan.jpg
      , threadCreatedAt = mockTime1
      , threadBumpedAt = mockTime3
      }
  , Thread
      { threadId = 2
      , threadBoardId = 7  -- /t/
      , threadTitle = "Which distro do you recommend?"
      , threadText = "Coming from Windows, want to switch over."
      , threadAttachment = Att.NoAttachment
      , threadCreatedAt = mockTime2
      , threadBumpedAt = mockTime2
      }
  , Thread
      { threadId = 3
      , threadBoardId = 11 -- /fp/
      , threadTitle = "Haskell vs PureScript"
      , threadText = "For web projects, which one would you pick?"
      , threadAttachment = Att.ImageFile mockImage1  -- haskell-purescript.png
      , threadCreatedAt = mockTime3
      , threadBumpedAt = mockTime3
      }
  , Thread
      { threadId = 4
      , threadBoardId = 4  -- /a/
      , threadTitle = "Rei best girl"
      , threadText = "No further comments needed."
      , threadAttachment = Att.ImageFile mockImage3  -- rei-ayanami.jpg
      , threadCreatedAt = mockTime1
      , threadBumpedAt = mockTime2
      }
  , Thread
      { threadId = 5
      , threadBoardId = 1  -- /b/
      , threadTitle = "random gif I found"
      , threadText = "no context needed"
      , threadAttachment = Att.GifFile mockGif
      , threadCreatedAt = mockTime2
      , threadBumpedAt = mockTime3
      }
  ]

mockPosts :: [Post]
mockPosts =
  [ Post
      { postId = 1
      , postThreadId = 1
      , postContent = TextOnly "Thanks for setting up the board!"
      , postCreatedAt = mockTime2
      }
  , Post
      { postId = 2
      , postThreadId = 1
      , postContent = TextOnly "Finally, a clean imageboard. OPSEC matters."
      , postCreatedAt = mockTime3
      }
  , Post
      { postId = 3
      , postThreadId = 2
      , postContent = TextOnly "Try Mint, it's the friendliest to start with."
      , postCreatedAt = mockTime2
      }
  , Post
      { postId = 4
      , postThreadId = 3
      , postContent = TextOnly "I'd go with PureScript, Web Audio API as a bonus."
      , postCreatedAt = mockTime3
      }
  , Post
      { postId = 5
      , postThreadId = 3
      , postContent = TextAndAttachment "Scotty gang rise up" (ImageFile mockImage1)
      , postCreatedAt = mockTime3
      }
  , Post
      { postId = 6
      , postThreadId = 4
      , postContent = TextOnly "Agreed. No further discussion required."
      , postCreatedAt = mockTime2
      }
  , Post
      { postId = 7
      , postThreadId = 5
      , postContent = AttachmentOnly (GifFile mockGif)
      , postCreatedAt = mockTime3
      }
  ]
