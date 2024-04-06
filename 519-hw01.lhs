--------------------------------------------------------------------------------
CIS 623 Structured programming and formal methods

Fall 2022

Homework 01  Defining functions; Syntax of Access control logic

-------------------------------------------------------------------------------

> import Prelude hiding (init)

Total points: 115

-------------------------------------------------------------------------------


(10 point) Fill in the following information. You will lose 3 point for each 
missing or incorrect answer.

Name: Shivani Anil Neharkar

Email: sanehark@syr.edu

Number: 519

ie. The 3 digit number assigned to you

-------------------------------------------------------------------------------

Due date:

Release:        Sep 20, 2022 
Due date:       Sep 27, 2022, 11:59 pm

Remarks:

This homework has two parts. Namely:

Part I:  Formal methods
Part II: Programming 


You will need to turn in Part I and Part II SEPARATELY, using two different 
links from our blackboard site.

For Part I, you will need to 

1. name your submission as a pdf file named XXX-hw01-I.pdf where XXX is the 3 
digit no. assigned to you in blackboard. 

2. To obtain a pdf copy, you are advised to write your answer using letter 
sized paper and scan them (use Library) after completion and use, upload the pdf 
file you obtained you obtained.


For Part II, you will follow the rules as in HW 00. That is:

1. (5 point) You submission should be named as XXX-hw01.lhs where XXX is the 3 
digit no. assigned to you in blackboard.

You will lose 5 point if you do not following this naming convention. 

2. We do not accept any late submissions.
3. If you encounter any difficulties, and but you can upload your submission
   within an hour after the due date, please state the reason below:

State the reason(s) for late submission below (if needed):



4. If you cannot upload your submission within an hour after the due date
   because of a valid reason (eg. network/power outage etc.)  contact the
   grader at 

   ymfarhat@syr.edu 

   when email is available. Your grader will not grade your work but you may 
   receive an exemption.

--------------------------------------------------------------------------------

Note:

To answer the programming questions, add the haskell code according to the
requirement. DO NOT FORGET to add the > symbol below each line in your code.

--------------------------------------------------------------------------------
Part I: Formal methods
--------------------------------------------------------------------------------

Problem 1 (Total 20 point. 5 point each)

ACST Exercise 2.1.1, part e, f, g and h.


Problem 2 (Total 20 point, 10 points each)

ACST Exercise 2.2.1 part c, e. If the resulting formula is a well-formed 
formula, give the syntactic derivation as in Example 2.6.  If not, give reasons
to support your answer.

--------------------------------------------------------------------------------
Part II: Programming
--------------------------------------------------------------------------------

Problem 3 (Total 20 point)

Wildcard patterns

Complete the implementation of the functions nand (not and), xor (exclusive or) 
in the space provided. In your code, use the wildcard pattern _ to combine 
multiple equations. 

-------------------------------------------------------------------------------- 
The nand function and xor function are both Boolean functions that defined
by truth tables. Look up their definitions and implement them as Haskell 
functions. Use the wildcard to simplify your code.


*** Put your code for nand function  below. DO NOT FORGET to add the > symbol.

i. nand

Answer:

> nand :: Bool->Bool->Bool
> nand True True = False
> nand _ _ = True



*** Put your code for xor function below.  DO NOT FORGET to add the > symbol.

ii. xor

Answer:


> xor :: Bool->Bool->Bool
> xor True False = True
> xor False True = True
> xor _ _ = False


-------------------------------------------------------------------------------- 

Problem 4 (Total: 20 point)

Recall that when specify the nth element of a list (n >= 0), we count from zero 
(Hutton, page 15-16). By following this convention, write the function dropOdd 
which, take a list xs as input, removes all the elements from the list where 
their positions are odd numbers. For example:

    *Main> dropOdd [1,2,3,4]
    [1,3]
 
*** Put your answer below. For codes, DO NOT FORGET to add the > symbol.

> dropOdd    :: [a] -> [a]  -- continue to fill in your code below
> dropOdd [] = []
> dropOdd [x] = [x]
> dropOdd (x:y:xs) = [x] ++  dropOdd xs

Test Case:

Test 1 Input: dropOdd [3,33,333,3333]

Expected result: [3,333]

Test Run:
*Main> dropOdd [3,33,333,3333]
[3,333]

--------------------------------------------------------------------------------

Problem 5 (Total 20 point)

Defining a function via recursion (Hutton Section 6.8, ex. 7)

    Define a recursive function  

    merge :: (Ord a) => [a] -> [a] -> [a]

    that merges two sorted lists of values to give a single sorted list. 

    For example:

    *main> merge [2,5,6] [1,3,4]
    [1,2,3,4,5,6]


*** Put your answer below. For codes, DO NOT FORGET to add the > symbol.

> merge :: Ord a => [a] -> [a] -> [a]
> merge xs []                         = xs
> merge [] ys                         = ys
> merge [] []                         = []
> merge (x: xs) (y : ys)  | x <= y    = x : merge xs (y:ys)
>                         | otherwise = y : merge (x:xs) ys


Test Case:

Test 1 Input: merge [1,2,4,5] [9,12,14]

Expected result: [1,2,4,5,9,12,14]

Test Run:
*Main> merge [1,2,4,5] [9,12,14]
[1,2,4,5,9,12,14]


--------------------------------------------------------------------------------
End of Homework 01 Part II submission
--------------------------------------------------------------------------------