{-# LANGUAGE OverloadedStrings #-}

module Domain.Boards (allBoards) where

import Domain.Board

-- Hardcoded Boards for starting
-- Should migrate to the database in the future.
-- But for now, used to avoid unnecessary DB queries.

allBoards :: [Board]
allBoards =
  [ Board { boardId = 1,  boardAcronym = "b",  boardName = "Random",               boardCategory = General,   boardSticky = Nothing }
  , Board { boardId = 2,  boardAcronym = "hu", boardName = "Humanity",             boardCategory = General,   boardSticky = Nothing }
  , Board { boardId = 3,  boardAcronym = "wv", boardName = "Worksafe Videos",      boardCategory = General,   boardSticky = Nothing }

  , Board { boardId = 4,  boardAcronym = "a",  boardName = "Anime & Manga",        boardCategory = Interests, boardSticky = Nothing }
  , Board { boardId = 5,  boardAcronym = "v",  boardName = "Videogames",           boardCategory = Interests, boardSticky = Nothing }
  , Board { boardId = 6,  boardAcronym = "i",  boardName = "Other Interests",      boardCategory = Interests, boardSticky = Nothing }

  , Board { boardId = 7,  boardAcronym = "t",  boardName = "Tech General",         boardCategory = Tech,      boardSticky = Nothing }
  , Board { boardId = 8,  boardAcronym = "l",  boardName = "Linux",                boardCategory = Tech,      boardSticky = Nothing }
  , Board { boardId = 9,  boardAcronym = "c",  boardName = "Computer Science",     boardCategory = Tech,      boardSticky = Nothing }
  , Board { boardId = 10, boardAcronym = "p",  boardName = "Programming",          boardCategory = Tech,      boardSticky = Nothing }
  , Board { boardId = 11, boardAcronym = "fp", boardName = "Functional Programming", boardCategory = Tech,    boardSticky = Nothing }

  , Board { boardId = 12, boardAcronym = "h",  boardName = "Hentai",               boardCategory = NSFW,      boardSticky = Nothing }
  ]
