module Cis194.SExprSpec (main, spec) where

import Test.Hspec
import Cis194.SExpr
import Cis194.AParser
import Data.Char

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "zeroOrMore" $ do
    it "returns an empty list if no matches" $ do
      pendingWith "Not implemented yet"
      -- runParser (zeroOrMore (satisfy isUpper)) "abcdeFGh" `shouldBe` Just ("","abcdeFGh")

    it "returns the substring, if a match is found" $ do
      pendingWith "Not implemented yet"
      -- runParser (zeroOrMore (satisfy isUpper)) "ABCdeFGh" `shouldBe` Just ("ABC","deFGh")

  describe "oneOrMore" $ do
    it "returns Nothing if no match" $ do
      pendingWith "Not implemented yet"
      -- runParser (oneOrMore (satisfy isUpper)) "abcdeFGh" `shouldBe` Nothing

    it "returns the substring, if a match is found" $ do
      pendingWith "Not implemented yet"
      -- runParser (oneOrMore (satisfy isUpper)) "ABCdeFGh" `shouldBe` Just ("ABC","deFGh")

  describe "spaces" $ do
    it "parses a consecutive list of one or more whitespace characters" $ do
      pendingWith "Not implemented yet"
      -- runParser (spaces) "Hello World" `shouldBe` Just ("", "Hello World")
      -- runParser (spaces) "   Hello World" `shouldBe` Just ("   ", "Hello World")

  describe "ident" $ do
    -- Next, ident should parse an identifier, which for our
    -- purposes will be an alphabetic character (use isAlpha)
    -- followed by zero or more alphanumeric characters (use
    -- isAlphaNum).
    it "parses an identifier: an alpha char followed by zero or more alphanums" $ do
      pendingWith "Not implemented yet"
      -- runParser ident "foobar baz" `shouldBe` Just ("foobar"," baz")
      -- runParser ident "foo33fA" `shouldBe` Just ("foo33fA","")
      -- runParser ident "2bad" `shouldBe` Nothing
      -- runParser ident "" `shouldBe` Nothing

  describe "parseSExpr" $ do
    it "parses an integer" $ do
      pendingWith "Not implemented yet"
      -- runParser parseSExpr "5" `shouldBe` Just (A (N 5),"")

    it "ignores leading and trailing spaces" $ do
      pendingWith "Not implemented yet"
      -- runParser parseSExpr "   10  " `shouldBe` Just (A (N 10),"")

    it "parses an identifier" $ do
      pendingWith "Not implemented yet"
      -- runParser parseSExpr "foo3" `shouldBe` Just (A (I "foo3"),"")

    it "parsers compound S expressions" $ do
      pendingWith "Not implemented yet"
      -- runParser parseSExpr "(bar (foo) 3 5 874)" `shouldBe` 
      --   Just (Comb [A (I "bar"), (Comb [A (I "foo")]), A (N 3), A (N 5), A (N 874)], "")
      -- runParser parseSExpr "(((lambda x (lambda y (plus x y))) 3) 5)" `shouldBe` 
      --   Just (Comb [Comb [Comb [A (I "lambda"), A (I "x"), 
      --     Comb [A (I "lambda"), A (I "y"), 
      --       Comb [A (I "plus"), A (I "x"), A (I "y")] ] ], A (N 3) ], A (N 5)], "")
      -- runParser parseSExpr " ( lots of ( spaces in ) this ( one ) ) " `shouldBe`
      --   Just (Comb [A (I "lots"), A (I "of"), Comb [A (I "spaces"), A (I "in")], A (I "this"), Comb [A (I "one")] ], "")

