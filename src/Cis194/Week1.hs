module Cis194.Week1 where

-------------
-- Ex 1-4  --
-------------

toDigits :: Integer -> [Integer]
toDigits 0 = []
toDigits x = if x < 0
             then []
             else toDigits (x `div` 10) ++ [x `mod` 10]

toDigitsRev :: Integer -> [Integer]
toDigitsRev x = reverse (toDigits x)

doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther [] = []
doubleEveryOther xs = reverse (doDoubleEveryOther (reverse xs))

doDoubleEveryOther (x : y : xs) = x : y * 2 : doDoubleEveryOther xs
doDoubleEveryOther xs = xs

sumDigits :: [Integer] -> Integer
sumDigits xs = doSumDigits xs 0

doSumDigits (x : xs) acc = doSumDigits xs (sum (toDigits x) + acc)
doSumDigits        _ acc = acc

validate :: Integer -> Bool
validate x = total x `mod` 10 == 0

total x = sumDigits (doubleEveryOther (toDigits x))

---------------------
-- Towers of Hanoi --
---------------------

type Peg = String
type Move = (Peg, Peg)

hanoi :: Integer -> Peg -> Peg -> Peg -> [Move]
hanoi 0 _ _ _ = []
-- hanoi discs peg_a peg_b peg_c = [(peg_a, peg_b)] --(hanoi (x-1) peg_a peg_c peg_b) ++ [(peg_a, peg_b)] ++ (hanoi (x-1) peg_c peg_b peg_a)
hanoi discs peg_a peg_b peg_c = (hanoi (discs - 1) peg_a peg_c peg_b) ++ [(peg_a, peg_b)] ++ (hanoi (discs - 1) peg_c peg_b peg_a)

hanoi4 :: Integer -> Peg -> Peg -> Peg -> Peg -> [Move]
hanoi4 _ _ _ _ _ = []
