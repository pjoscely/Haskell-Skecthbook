-- Project Euler
-- https://projecteuler.net/

-- Even Fibonacci numbers
 
-- Problem 2
-- Each new term in the Fibonacci sequence is generated by adding the previous two terms. 
-- By starting with 1 and 2, the first 10 terms will be:

-- 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

-- By considering the terms in the Fibonacci sequence whose values do not exceed four million, 
-- find the sum of the even-valued terms.

-- Fast fibonacci with memoization
-- The nice lazy solution was taken from: https://wiki.haskell.org/Memoization
memoized_fib :: Int -> Integer
memoized_fib = (map fib [0 ..] !!)
   where fib 0 = 1
         fib 1 = 2
         fib n = memoized_fib (n-2) + memoized_fib (n-1)

-- Tests if an integer is divisible by 2
-- Could use built in even function 
div_by_2 :: Integral a => a -> Bool
div_by_2 n
    |n `mod` 2  ==  0 = True
    | otherwise = False

-- Compute answer

total = sum$filter (<= 4000000)$filter div_by_2$map memoized_fib [0..40] 

-- total 4613732
-- (0.01 secs, 164,248 bytes)

-- Congratulations, the answer you gave to problem 2 is correct.

-- You are the 759896th person to have solved this problem.


