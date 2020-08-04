{-

Project Euler
https://projecteuler.net/
Pentagon numbers
 
Problem 44
Pentagonal numbers are generated by the formula, Pn=n(3n−1)/2. 

The first ten pentagonal numbers are:

1, 5, 12, 22, 35, 51, 70, 92, 117, 145, ...

It can be seen that P4 + P7 = 22 + 70 = 92 = P8. 
However, their difference, 70 − 22 = 48, is not pentagonal.

Find the pair of pentagonal numbers, Pj and Pk, for which their 
sum and difference are pentagonal and D = |Pk − Pj| is minimised; 
what is the value of D?
-}
import Data.List
import qualified Data.Set as Set

-- Create list of pentagonal numbers
pent :: [Integer]
pent = [p|n<- [1..3000], let p = n*(3*n-1)`div`2]

-- Cast the list as a set 
pent_set :: Set.Set Integer
pent_set = Set.fromList pent

-- Use set membership to filter out the solution
answer :: Integer
answer = head [diff|p1 <-pent, p2<-pent ,let diff = p1-p2,
                   let sum = p1+p2, Set.member diff pent_set,
                   Set.member sum pent_set]                 
--  main -> 5482660
-- (3.76 secs, 989,739,120 bytes)
main :: IO ()
main = do  
    (putStrLn.show) answer
    
-- Congratulations, the answer you gave to problem 44 is correct.

-- You are the 56764th person to have solved this problem

