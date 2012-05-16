import Prelude hiding (length, sum, product, map, filter)

length :: [a] -> Int
length []     = 0
length (x:xs) = 1 + length xs

sum :: Num a => [a] -> a
sum []     = 0
sum (x:xs) = x + sum xs

product :: Num a => [a] -> a
product []     = 1
product (x:xs) = x * product xs

map :: (a -> b) -> [a] -> [b]
map _ []     = []
map f (x:xs) = f x:map f xs

filter :: (a -> Bool) -> [a] -> [a]
filter _ []                 = []
filter p (x:xs) | p x       = x:filter p xs
                | otherwise = filter p xs
