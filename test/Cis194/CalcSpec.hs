module Cis194.CalcSpec (main, spec) where

import Test.Hspec
import Cis194.Calc
import Cis194.ExprT

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "Calculator - eval" $ do
    it "should add and multiply numbers" $ do
      pendingWith "Not implemented yet"
      -- eval (Mul (Add (Lit 2) (Lit 3)) (Lit 4)) `shouldBe` 20

  describe "Calculator - evalStr" $ do
    it "should evaluate well formed strings" $ do
      pendingWith "Not implemented yet"
      -- evalStr "(2+3)*4" `shouldBe` Just 20
    it "evals the multiplication operator before addition" $ do
      pendingWith "Not implemented yet"
      -- evalStr "2+3*4" `shouldBe` Just 14
    it "returns Nothing if the string is malformed" $ do
      pendingWith "Not implemented yet"
      -- evalStr "2+3*" `shouldBe` Nothing

  describe "Expr ExprT" $ do
    it "should generate ExprT expression" $ do
      pendingWith "Not implemented yet"
      -- (mul (add (lit 2) (lit 3)) (lit 4)) `shouldBe` (Mul (Add (Lit 2) (Lit 3)) (Lit 4))

  describe "Expr Integer" $ do
    it "should calculate integer value" $ do
      pendingWith "Not implemented yet"
      -- (mul (add (lit 2) (lit 3)) (lit 4)) `shouldBe` (20::Integer)

  describe "Expr Bool" $ do
    it "should treat positive literals as True" $ do
      pendingWith "Not implemented yet"
      -- (lit 3) `shouldBe` True

    it "should treat negative literals as False" $ do
      pendingWith "Not implemented yet"
      -- (lit (-2)) `shouldBe` False

    it "should treat additon as a logical OR" $ do
      pendingWith "Not implemented yet"
      -- (add (lit 1) (lit 1)) `shouldBe` True
      -- (add (lit (-1)) (lit 1)) `shouldBe` True
      -- (add (lit 1) (lit (-1))) `shouldBe` True
      -- (add (lit (-1)) (lit (-1))) `shouldBe` False

    it "should treat multiplicsation as a logical AND" $ do
      pendingWith "Not implemented yet"
      -- (mul (lit 1) (lit 1)) `shouldBe` True
      -- (mul (lit (-1)) (lit 1)) `shouldBe` False
      -- (mul (lit 1) (lit (-1))) `shouldBe` False
      -- (mul (lit (-1)) (lit (-1))) `shouldBe` False

    it "should calculate integer value" $ do
      pendingWith "Not implemented yet"
      -- (mul (add (lit 2) (lit 3)) (lit 4)) `shouldBe` True

  describe "Expr MinMax" $ do
    it "should return integer for lit" $ do
      pendingWith "Not implemented yet"
      -- (lit 4) `shouldBe` (MinMax 4)

    it "should return the largest for add" $ do
      pendingWith "Not implemented yet"
      -- (add (lit 4) (lit 8)) `shouldBe` (MinMax 8)

    it "should return the smallest for mul" $ do
      pendingWith "Not implemented yet"
      -- (mul (lit 4) (lit 8)) `shouldBe` (MinMax 4)

  describe "Expr Mod7" $ do
    it "should return integer for within the range 0-7" $ do
      pendingWith "Not implemented yet"
      -- (lit 4) `shouldBe` (Mod7 4)
      -- (lit 8) `shouldBe` (Mod7 1)
      -- (lit (-2)) `shouldBe` (Mod7 5)

    it "should perform addition and multiplication modulo 7" $ do
      pendingWith "Not implemented yet"
      -- (add (lit 6) (lit 9)) `shouldBe` (Mod7 1)
      -- (mul (lit 4) (lit 10)) `shouldBe` (Mod7 5)
