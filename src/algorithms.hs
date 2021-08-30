import Data.List

{-
- Function : odd (int n)
- assumes n >= 1
- returns the n-th odd natural number
-}
oddNumber :: Integer -> Integer 
oddNumber n
    | n < 1 = -1
    | otherwise = if n == 1 then 1 else oddNumber(n-1) + 2


{-
- Function : factorial (int n)
- assumes n >= 0
- returns the factorial of a number n
-}
factorial :: Integer -> Integer 
factorial n = 
    if n >= 0 then 
        if n == 0 then 1
        else n * factorial (n-1)
    else error "Negative number factorial Error"


{-
- Function : pow (int b, int n)
- assumes n >= 0, b !=0
- returns b^n
-}
power :: (Num a2,Eq a2, Integral a1) => a2 -> a1 -> a2
power b n
    | b == 0 && n == 0 = error "Zero power Zero error"
    | n == 0 = 1
    | even n = power b (n`quot`2) * power b (n`quot`2)
    | otherwise = b * power b ((n-1)`quot`2) * power b ((n-1)`quot`2)
    

{-
- Function : bin (int n, int k)
- assumes n >= k >= 0, n >=0
- returns the binomial(n, k)
-}
bin :: Integral p => p -> p -> p
bin n k
    | not(n >= 0 && n >= k && k >= 0) = error "Unexpected Error"
    | k == 0 = 1
    | otherwise = bin n (k-1) * (n-k+1) `quot` k


{-
- Function : div (int n, int k)
- assumes 0 <= k <= n
- returns the numbers of divisors of n, lower or equal to k
-}
division :: (Num a2, Integral a1) => a1 -> a1 -> a2
division n k
    | not(k >= 0 && k <= n) = error "Unexpected Error"
    | k == 0 = 0
    | mod n k == 0 = division n (k-1) + 1
    | otherwise = division n (k-1)


{-
- Function : fib (int n)
- return the n-th fibonacci number
-}
fib :: (Ord a, Num a, Num p) => a -> p
fib n
    | n <= 2 = 1
    |otherwise = fib (n-1) + fib (n-2)


{-
- Function : fibn (int n)
- return the n-th fibonacci number, using memorization
-}
fibn :: Num a => Int -> a
fibn n = fibs !! n
    where
    fibs = 0 : 1 : map f [2..]
    f n = fibs !! (n-1) + fibs !! (n-2)


{-
- Function: paln (vector, int i, int n)
- return true if the [Char] is a palindrome
- assums the [Char] is lower case and with no spaces
- i >= 0 and n - i > 0 
-}
paln :: Eq a => [a] -> Int -> Int -> Bool
paln xs i n 
    | n == i = True
    | xs !! n == xs !! i = paln xs (i + 1) (n - 1)
    | otherwise = False


{-
- Function : binarySearch(vector, int start, int end, int value)
- assumes that the vector is sorted, end-start+1 >= 0
- return the index K , K > 0 if vector[K] = value, or -1 if value ∉ vector[start...end]
-}
binarySearch :: Ord t => [t] -> Int -> Int -> t -> Int
binarySearch xs start end k =
    if end - start + 1 == 0 then -1
    else do
        let m = (start+end) `quot` 2
        if xs !! m == k then m
        else if xs !! m > k then binarySearch xs start (m-1) k
        else binarySearch xs (m+1) end k

