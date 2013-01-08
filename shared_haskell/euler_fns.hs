module Euler where

--orderedList :: (a -> a -> b) -> (b -> b -> Ordering) -> [a] -> [a] -> [b]
--orderedList comboFn orderFn l1@(x:xs) l2@(y:ys) = orderedLists
--  where
--    firstItem = comboFn x y
--    orderedList' :: [a] -> [a] -> b -> b -> [b]
--    orderedList' lftLst@(l:l':ls) rgtLst@(r:r':rs) lftItem rgtItem =
--      | ord == GT = lftItem : orderedList' ls rgtLst newLftItem rgtItem
--      | otherwise = rg  tItem : orderedList' lftLst rs lftItem newRgtItem
--    orderedList' (l:ls) (r:rs) item _ =
--        where
--          newLftItem = comboFn l' r
--          newRgtItem = comboFn l r'
--          ord        = orderFn (comboFn l' r) (comboFn l r')
--

combos :: Ord a => (a -> a -> a) -> [a] -> [a] -> [[a]]
combos _ [] _ = []
combos comboFn (x:xs) ys = (map (comboFn x) ys) : (combos comboFn xs ys)


ordCombos :: Ord a => (a -> a -> a) -> (a -> a -> Ordering) -> [a] -> [a] -> [a]
ordCombos _ _ [] _ = []
ordCombos _ _ _ [] = []
ordCombos comboFn orderFn l1 l2 = orderCombos (combos comboFn l1 l2)

orderCombos :: Ord a => [[a]] -> [a]
orderCombos ([])         = []
orderCombos ((x:xs):[])     = x : orderCombos [xs]
orderCombos ([]:(x:xs):[])  = x : orderCombos [xs]
orderCombos (xs:[]:ys)      = orderCombos (xs:ys)
orderCombos ([]:xs)         = orderCombos xs
orderCombos (xs@(x:xs'):ys@(y:ys'):zs)
  | which == LT         = x : (orderCombos (xs': ys : zs) )
  | otherwise           = y : (orderCombos (xs : ys': zs) )
    where which = compare x y

firstItems :: [[a]] -> (a, a)
firstItems ((x:xs):(y:ys):_) = (x, y)





--   3   3 2 1
--   2   3 2 1
--   1   3 2 1
--
--   3   2 1
--   2   3
--
--
--

