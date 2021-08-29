import Data.List
import GHC.Types ( Any )
import Distribution.FieldGrammar (List)

oddNumber :: Integer -> Integer 
oddNumber n
    | n < 1 = -1
    | otherwise = if n == 1 then 1 else oddNumber(n-1) + 2


factorial :: Integer -> Integer 
factorial n = 
    if n >= 0 then 
        if n == 0 then 1
        else n * factorial (n-1)
    else -1


power :: (Num a2,Eq a2, Integral a1) => a2 -> a1 -> a2
power b n
    | b == 0 && n == 0 = error "Zero power Zero error"
    | n == 0 = 1
    | even n = power b (n`quot`2) * power b (n`quot`2)
    | otherwise = b * power b ((n-1)`quot`2) * power b ((n-1)`quot`2)
    


bin :: Integral p => p -> p -> p
bin n k
    | not(n >= 0 && n >= k && k >= 0) = error "Unexpected Error"
    | k == 0 = 1
    | otherwise = bin n (k-1) * (n-k+1) `quot` k



division :: (Num a2, Integral a1) => a1 -> a1 -> a2
division n k
    | not(k >= 0 && k <= n) = error "Unexpected Error"
    | k == 0 = 0
    | mod n k == 0 = division n (k-1) + 1
    | otherwise = division n (k-1)



fib :: (Ord a, Num a, Num p) => a -> p
fib n
    | n <= 2 = 1
    |otherwise = fib (n-1) + fib (n-2)

-- return the n-th fibonacci number, using memorization
fibn :: Num a => Int -> a
fibn n = fibs !! n
    where
    fibs = 0 : 1 : map f [2..]
    f n = fibs !! (n-1) + fibs !! (n-2)
