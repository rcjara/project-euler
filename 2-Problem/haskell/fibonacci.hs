module Fibonacci where

fibs :: [Integer]
fibs = [1, 2] ++ makeFibs 1 2
  where
    makeFibs :: Integer -> Integer -> [Integer]
    makeFibs x y = z : makeFibs y z
      where z = x + y
