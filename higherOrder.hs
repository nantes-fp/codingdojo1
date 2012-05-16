import Prelude hiding (length, and, or, all, any, sum, product)

-- some functions expressed with foldl (may not be the optimal implementation)

length :: [a] -> Int
length = foldl (\l _ -> l + 1) 0

and :: [Bool] -> Bool
and = foldl (&&) True

or :: [Bool] -> Bool
or = foldl (||) False

all :: (a -> Bool) -> [a] -> Bool
all p = foldl (\a b -> a && p b) True

any :: (a -> Bool) -> [a] -> Bool
any p = foldl (\a b -> a || p b) False

sum :: Num a => [a] -> a
sum = foldl (+) 0

product :: Num a => [a] -> a
product = foldl (*) 1

-- some map examples

lengths :: [[a]] -> [Int]
lengths = map length

areEvenLengths :: [[a]] -> [Bool]
areEvenLengths = map (even.length)

-- some filter examples

pairs :: Integral a => [a] -> [a]
pairs = filter even

positives :: (Num a, Ord a) => [a] -> [a]
positives = filter (> 0)
