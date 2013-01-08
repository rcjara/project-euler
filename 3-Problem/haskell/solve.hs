import Primes

main = do
  let ans = head (pFactors 600851475143)
  putStrLn (show ans)
