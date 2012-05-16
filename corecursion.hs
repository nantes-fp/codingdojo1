naturals = 0:map (+1) naturals

ones = 1:ones

fibonaccis = 0:1:zipWith (+) fibonaccis (tail fibonaccis)

factorials = 1:zipWith (*) [1..] factorials
