module Cis194.Week1 where

-------------
-- Ex 1-4  --
-------------

toDigits :: Integer -> [Integer]
toDigits x = reverse (toDigitsRev x)

toDigitsRev :: Integer -> [Integer]
toDigitsRev 0 = []
toDigitsRev x = if x < 0
                then []
                else x `mod` 10 : toDigitsRev (x `div` 10)

doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther xs = reverse (doubleEveryOtherRev (reverse xs))

doubleEveryOtherRev :: [Integer] -> [Integer]
doubleEveryOtherRev [] = []
doubleEveryOtherRev [x] = [x]
doubleEveryOtherRev (x : y : zs) = x : y*2 : doubleEveryOtherRev zs


sumDigits :: [Integer] -> Integer
sumDigits xs = sum (xs >>= toDigits)

validate :: Integer -> Bool
validate x = checksum `mod` 10 == 0
  where checksum = sumDigits (doubleEveryOther (toDigits x))

---------------------
-- Towers of Hanoi --
---------------------

type Peg = String
type Move = (Peg, Peg)

hanoi :: Integer -> Peg -> Peg -> Peg -> [Move]
hanoi 0 _ _ _ = []
hanoi 1 from to _temp = [(from, to)]
hanoi n from to temp = (hanoi (n-1) from temp to) ++ (hanoi 1 from to temp) ++ (hanoi (n-1) temp to from)

-- hanoi4 using Frame-Stewart algorithm
hanoi4 :: Integer -> Peg -> Peg -> Peg -> Peg -> [Move]
hanoi4 0 _ _ _ _ = []
hanoi4 1 from to _temp1 _temp2 = [(from, to)]
hanoi4 n from to temp1 temp2 = hanoi4k n (bestk n) from to temp1 temp2

bestk :: Integer -> Integer
bestk n = n - round(sqrt(fromIntegral(2*n+1))) + 1

hanoi4k :: Integer -> Integer -> Peg -> Peg -> Peg -> Peg -> [Move]
hanoi4k n k from to temp1 temp2 = (hanoi4 k from temp1 to temp2) ++ (hanoi (n-k) from to temp2) ++ (hanoi4 k temp1 to from temp2)
