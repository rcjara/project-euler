module Primes where

import Multiples(divides)
import Data.Maybe
import Data.List(find)

primes :: [Integer]
primes = 2 : filter isPrime [3, 5..]

isPrime :: Integer -> Bool
isPrime n = (fromJust potential) ^ 2 > n
  where
    potential = find fn primes
    fn p = p `divides` n || p ^ 2 > n

pFactors :: Integer -> [Integer]
pFactors = factors [] primes
  where
    factors :: [Integer] -> [Integer] -> Integer -> [Integer]
    factors found _ 1 = found
    factors found (p:ps) i
      | p `divides` i = factors (p:found) (p:ps)  (i `div` p)
      | otherwise     = factors found     ps      i
