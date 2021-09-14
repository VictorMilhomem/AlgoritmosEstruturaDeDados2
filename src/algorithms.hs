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
palindrome :: Eq a => [a] -> Int -> Int -> Bool
palindrome xs i n
    | n == i = True
    | xs !! n == xs !! i = palindrome xs (i + 1) (n - 1)
    | otherwise = False


{-
- Function : binarySearch(vector, int start, int end, int value)
- assumes that the vector is sorted, end-start+1 >= 0
- return the index N , N > 0 if vector[N] = value, or -1 if value ∉ vector[start...end]
-}
binarySearch :: Ord t => [t] -> Int -> Int -> t -> Int
binarySearch xs start end k =
    if end - start + 1 == 0 then -1
    else do
        let m = (start+end) `quot` 2
        if xs !! m == k then m
        else if xs !! m > k then binarySearch xs start (m-1) k
        else binarySearch xs (m+1) end k


{-
- Function : sumVector(vector, int start, int end)
- assumes that  end-start+1 >= 0
- return the sum of elements in the vector
-}
sumVetor :: Num a => [a] -> Int -> Int -> a
sumVetor xs start end = do
    if start == end then xs !! end
    else do
        let s = (xs !! start) + (xs !! end)
        if end - start == 1 then s
        else
            sumVetor xs (start+1) (end-1)  + s


{-
- Function : squareRoot(int n, int low, int high)
- assumes n ≥ 0 e low ≤ ⌊√(n)⌋ < high 
- return ⌊√(n)⌋
-}
squareRoot :: Integral t => t -> t -> t -> t
squareRoot n low high =
    if high - low > 1 then do
        let m = (low + high) `quot` 2
        if m * m == n then m
        else if m * m < n then squareRoot n (m+1) high
        else squareRoot n low m
    else low


{-
- Function : qsort(vector)
- sort the vector using a partition function as aux
-}
qsort :: Ord a => [a] -> [a]
qsort []     = []
qsort (x:xs) = qsort lesser ++ equal ++ qsort greater
    where
        (lesser,equal,greater) = part x xs ([],[x],[])


part :: Ord a => a -> [a] -> ([a],[a],[a]) -> ([a],[a],[a])
part _ [] (l,e,g) = (l,e,g)
part p (x:xs) (l,e,g)
    | x > p     = part p xs (l,e,x:g)
    | x < p     = part p xs (x:l,e,g)
    | otherwise = part p xs (l,x:e,g)


{-
- Function : mergesort(vector)
- sort the vector using a merge and split functions as aux
-}
mergesort :: (a -> a -> Bool) -> [a] -> [a]
mergesort pred []   = []
mergesort pred [x]  = [x]
mergesort pred xs = merge pred (mergesort pred xs1) (mergesort pred xs2)
  where
    (xs1,xs2) = split xs

split :: [a] -> ([a],[a])
split (x:y:zs) = (x:xs,y:ys) where (xs,ys) = split zs
split xs       = (xs,[])

merge :: (a -> a -> Bool) -> [a] -> [a] -> [a]
merge pred xs []         = xs
merge pred [] ys         = ys
merge pred (x:xs) (y:ys) =
  if pred x y then x: merge pred xs (y:ys) else y: merge pred (x:xs) ys


{-
- Function : poly_valiation(int vector, int x, int n)
- assumes n >= 0
- return the sum of (anxN + aN-1 xN-1 + ... + a1 x + a0.)
-}
poly_valiation :: Num t => [t] -> t -> Int -> t
poly_valiation vector x n 
    | n == 0 = vector !! n
    | otherwise = x * ((vector !! n) + poly_valiation vector x (n-1))