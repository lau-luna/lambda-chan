{-# LANGUAGE OverloadedStrings #-}

module Mock.Data
  (
  ) where

import Domain.Attachment
import Domain.Board
import Domain.Post
import Domain.Thread

mockBoards :: [Board]
mockBoards = 
  [
--    Board {boardAcronym="b", boardSticky=_boardSticky, boardName="Random", boardId=1}
  ]

mockThreads :: [Thread]
mockThreads =
  []

mockPosts :: [Post]
mockPosts = 
  [
  ]
