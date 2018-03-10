{-# OPTIONS_GHC -Wall #-}

module Cis194.ExprT
  ( ExprT
  )
  where

data ExprT = Lit Integer
           | Add ExprT ExprT
           | Mul ExprT ExprT
  deriving (Show, Eq)
