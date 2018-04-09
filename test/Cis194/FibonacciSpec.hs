module Cis194.FibonacciSpec (main, spec) where

import Test.Hspec
import Cis194.Fibonacci

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "fib" $ do
    it "should compute the nth Fibonacci number" $ do
      pendingWith "Not implemented yet"
      -- fib 0 `shouldBe` 0
      -- fib 1 `shouldBe` 1
      -- fib 2 `shouldBe` 1
      -- fib 14 `shouldBe` 377

  describe "fibs1" $ do
    it "should define an infinite list of all Fibonacci numbers" $ do
      pendingWith "Not implemented yet"
      -- take 5 fibs1 `shouldBe` [0, 1, 1, 2, 3]
