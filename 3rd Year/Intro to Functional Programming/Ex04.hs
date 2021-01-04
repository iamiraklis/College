
{- butrfeld Andrew Butterfield -}
module Ex04 where

name, idno, username :: String
name      =  "Iraklis Bogiatziou"  -- replace with your name
idno      =  "18329647"    -- replace with your student id
username  =  "bogiatzi"   -- replace with your TCD username

declaration -- do not modify this
 = unlines
     [ ""
     , "@@@ This exercise is all my own work."
     , "@@@ Signed: " ++ name
     , "@@@ "++idno++" "++username
     ]

-- Datatypes -------------------------------------------------------------------

-- do not change anything in this section !


-- a binary tree datatype, honestly!
data BinTree k d
  = Branch (BinTree k d) (BinTree k d) k d
  | Leaf k d
  | Empty
  deriving (Eq, Show)


-- Part 1 : Tree Insert -------------------------------

-- Implement:
ins :: Ord k => k -> d -> BinTree k d -> BinTree k d

ins a b Empty  = Leaf a b

ins a b (Leaf k d)
 | a > k     = Branch Empty (Leaf a b) k d
 | a < k     = Branch (Leaf a b) Empty k d
 | a == k    = Leaf a b

ins a b (Branch left right k d )
 | a < k     = Branch (ins a b left ) right  k d
 | a > k     = Branch left (ins a b right) k d
 | a == k    = Branch left right a b


-- Part 2 : Tree Lookup -------------------------------

-- Implement:
lkp :: (Monad m, Ord k) => BinTree k d -> k -> m d

lkp Empty k = fail "Fail Empty"

lkp (Leaf a b) k
  | a == k = return b
  | otherwise = fail "Fail Leaf"

lkp (Branch left right a b) k
  | a < k  = lkp right k
  | a == k = return b
  | a > k  = lkp left k


-- Part 3 : Tail-Recursive Statistics

{-
   It is possible to compute BOTH average and standard deviation
   in one pass along a list of data items by summing both the data
   and the square of the data.
-}
twobirdsonestone :: Double -> Double -> Int -> (Double, Double)
twobirdsonestone listsum sumofsquares len
 = (average,sqrt variance)
 where
   nd = fromInteger $ toInteger len
   average = listsum / nd
   variance = sumofsquares / nd - average * average

{-
  The following function takes a list of numbers  (Double)
  and returns a triple contaiœning
   the length of the list (Int)
   the sum of the numbers (Double)
   the sum of the squares of the numbers (Double)

   You will need to update the definitions of init1, init2 and init3 here.
-}
getLengthAndSums :: [Double] -> (Int,Double,Double)
getLengthAndSums ds = getLASs init1 init2 init3 ds
init1 = 0
init2 = 0
init3 = 0

{-
  Implement the following tail-recursive  helper function
-}
getLASs :: Int -> Double -> Double -> [Double] -> (Int,Double,Double)
getLASs length sum sq_sum (x:xs)= getLASs (length + 1) (sum + x) (sq_sum + x * x) (xs)
getLASs length sum sq_sum [] = (length, sum, sq_sum)

-- Final Hint: how would you use a while loop to do this?
--   (assuming that the [Double] was an array of double)
