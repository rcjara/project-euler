import Fibonacci

main = do
  let ans = foldl (+) 0 theFibs
  putStrLn (show ans)
    where
      allFibs = takeWhile (<= 4000000) fibs
      theFibs = filter (even) allFibs
