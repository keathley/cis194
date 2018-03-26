{-# OPTIONS_GHC -Wall #-}
module Cis194.LogAnalysis where

-- in ghci, you may need to specify an additional include path:
-- Prelude> :set -isrc/Cis194
import  Cis194.Log

parseMessage :: String -> LogMessage
parseMessage s =
  case words s of
    ("I" : timeStr : msgStr)         ->
      LogMessage Info (read timeStr) (unwords msgStr)

    ("W" : timeStr : msgStr)         ->
      LogMessage Warning (read timeStr) (unwords msgStr)

    ("E" : level : timeStr : msgStr) ->
      LogMessage (Error (read level)) (read timeStr) (unwords msgStr)

    _                                ->
      Unknown s

parse :: String -> [LogMessage]
parse = map parseMessage . lines

insert :: LogMessage -> MessageTree -> MessageTree
insert lm Leaf = Node Leaf lm Leaf
insert x@(LogMessage _ xTime _) (Node l y@(LogMessage _ yTime _) r)
  | xTime < yTime = Node (insert x l) y r
  | xTime > yTime = Node l y (insert x r)
insert _ mt = mt

build :: [LogMessage] -> MessageTree
build = foldr insert Leaf

inOrder :: MessageTree -> [LogMessage]
inOrder Leaf = []
inOrder (Node l x r) = inOrder l ++ [x] ++ inOrder r

-- whatWentWrong takes an unsorted list of LogMessages, and returns a list of the
-- messages corresponding to any errors with a severity of 50 or greater,
-- sorted by timestamp.
whatWentWrong :: [LogMessage] -> [String]
whatWentWrong messages = map messageText $ filter severe $ inOrder $ build messages

severe :: LogMessage -> Bool
severe (LogMessage (Error severity) _ _) = severity >= 50
severe _ = False

messageText :: LogMessage -> String
messageText lm = case lm of
  (LogMessage _ _ t) -> t
  (Unknown t) -> t
