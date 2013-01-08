module Multiples where

divides :: Integer -> Integer -> Bool
divides n = (== 0) . (`mod` n)
