main = do
  let ans = foldl (+) 0 (filter mults [1..999])
  putStrLn (show ans)
    where
      mults :: Integral a => a -> Bool
      mults i = (mult 3 i) || (mult 5 i)

      mult :: Integral a => a -> a -> Bool
      mult n = (== 0) . (`mod` n)

