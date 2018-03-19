module Cis194.Week1 where

-------------
-- Ex 1-4  --
-------------

toDigits :: Integer -> [Integer]
toDigits x = reverse (toDigitsRev x)

toDigitsRev :: Integer -> [Integer]
toDigitsRev x
  | x <= 0 = []
  | x < 10 = [x]
  | otherwise = mod x 10 : toDigitsRev (div x 10)

doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther xs = reverse (doubleEveryOtherRev (reverse xs))

doubleEveryOtherRev :: [Integer] -> [Integer]
doubleEveryOtherRev [] = []
doubleEveryOtherRev [x] = [x]
doubleEveryOtherRev (x:y:tail) = x:2*y:(doubleEveryOtherRev tail)

sumDigits :: [Integer] -> Integer
sumDigits [] = 0
sumDigits [x]
  | x < 10 = x
  | otherwise = sumDigits (toDigits x)
sumDigits (x:tail) = sumDigits [x] + (sumDigits tail)

validate :: Integer -> Bool
validate x = mod (sumDigits (doubleEveryOther (toDigits x))) 10 == 0

---------------------
-- Towers of Hanoi --
---------------------

type Peg = String
type Move = (Peg, Peg)

hanoi :: Integer -> Peg -> Peg -> Peg -> [Move]
hanoi 0 _ _ _ = []
hanoi x a b c = (hanoi (x-1) a c b) ++ [(a, b)] ++ (hanoi (x-1) c b a)

hanoi4 :: Integer -> Peg -> Peg -> Peg -> Peg -> [Move]
hanoi4 _ _ _ _ _ = []
