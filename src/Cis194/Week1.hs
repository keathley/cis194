module Cis194.Week1 where

-------------
-- Ex 1-4  --
-------------

toDigits :: Integer -> [Integer]
toDigits x = case x of
  x | x < 0 -> []
  0         -> []
  x         -> toDigits (x `div` 10) ++ [x `mod` 10]

-- toDigits x | x < 0 = []
-- toDigits 0         = []
-- toDigits x         = toDigits (x `div` 10) ++ [x `mod` 10]

toDigitsRev :: Integer -> [Integer]
toDigitsRev = reverse . toDigits

doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther = reverse . zipWith (*) (cycle [1,2]) . reverse

sumDigits :: [Integer] -> Integer
sumDigits = sum . concatMap toDigits

validate :: Integer -> Bool
validate x = total x `rem` 10 == 0 where
  total = sumDigits . doubleEveryOther . toDigits

---------------------
-- Towers of Hanoi --
---------------------

type Peg = String
type Move = (Peg, Peg)

hanoi :: Integer -> Peg -> Peg -> Peg -> [Move]
hanoi 0 _ _ _ = []
hanoi disks a b c = (hanoi (disks - 1) a c b) ++ [(a, b)] ++ (hanoi (disks - 1) c b a)

hanoi4 :: Integer -> Peg -> Peg -> Peg -> Peg -> [Move]
hanoi4 0 _ _ _ _ = []
hanoi4 1 a b _ _ = [(a, b)]
