module Lists where

myTail :: [a] -> Maybe [a]
myTail []     = Nothing
myTail [_] = Nothing
myTail (_:xs) = Just xs

-- my own version of enumFromTo
eft :: (Enum a, Ord a) => a -> a -> [a]
eft x y = case compare x y of
            GT -> []
            EQ -> [x]
            LT -> x: eft (succ x) y

-- split on delim
myWords :: String  -> [String]
myWords []   = []
myWords xs =  takeWhile (/= ' ') xs : (myWords . drop 1 . dropWhile (/= ' ') $ xs)

mySum :: (Num a) => [a] -> a
mySum = foldr (+) 0

removeArticles :: String -> [String]
-- removeArticles xs =  filter (/= "the" && /= "a" && /= "an") . myWords $ xs
removeArticles xs =  neq "the" . neq "a" . neq "an" . myWords $ xs
            where neq x = filter (/= x)

myZip :: [a] -> [b] -> [(a,b)]
myZip = zipWith (\x y -> (x, y))
