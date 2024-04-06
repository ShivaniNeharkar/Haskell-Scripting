--------------------------------------------------------------------------------
CIS 623 Structured programming and formal methods

Fall 2022

Homework 02  Defining functions using recursion and list comprehension

-------------------------------------------------------------------------------

> import Test.QuickCheck
> import Test.HUnit

Total points: 15 + 25 + 35 + 40 + 30 = 145 

-------------------------------------------------------------------------------


(10 point) Fill in the following information. You will lose 3 point for each 
missing or incorrect answer.

Name: Shivani Anil Neharkar

Email: sanehark@syr.edu

Number: 519

ie. The 3 digit number assigned to you

-------------------------------------------------------------------------------

Due date:

Release:        Sep 30, 2022 
Due date:       Oct 07, 2022, 11:59 pm

Remarks:

1. (5 point) You submission should be named as XXX-hw02.lhs where XXX is the 3 
digit no. assigned to you in blackboard.

You will lose 5 point if you do not follow this naming convention. 

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


** UNLESS OTHERWISE STATED, Do not use any functions from Prelude in your 
implementation. **


--------------------------------------------------------------------------------


Problem 1 (25 point. lambda expressions, modified from Hutton 4.8, ex. 7)

a. (15 point) Show, how the meaning of the following curried function definition 

> mult       :: Int -> Int -> Int -> Int
> mult x y z = x*y*z

can be formalized by defining the function in terms of lambda expressions. To
avoid naming conflicts, we will call the function you define mult1.

mult1 :: Int -> Int -> Int -> Int

*** Put your answer below. For codes, DO NOT FORGET to add the > symbol.

> mult1 :: Int -> Int -> Int -> Int
> mult1 = \x ->(\y ->(\z ->(x*y*z)))

Note: to complete this question, you may find the slides to Chapter 4 helpful.



b. (7 point) The function mult1 and mult are representing the same function.
Test your function mult1 (your answer to part a) against mult by completing the 
*BLANK* in the property test below:


*** Put your answer below. For codes, DO NOT FORGET to add the > symbol.


> prop_multeq       :: Int -> Int -> Int -> Bool
> prop_multeq x y z =  mult x y z == mult1 x y z


c. (3 point) Run quickCheck on prop_multeq and copy the results in the space 
below:

*Main> quickCheck prop_multeq
+++ OK, passed 100 tests.



--------------------------------------------------------------------------------

Problem 2 (Total 35 point) 

This question is modified from an exercise in Hutton Ch. 4.


The Luhn algorithm is used to check bank card numbers for simple errors such as 
mistyping a digit, and proceeds as follows:

-- consider each digit as a separate number;
-- moving left, double every other number from the second last;
-- subtract 9 from each number that is now greater than 9;
-- add all the resulting numbers together;
-- if the total is divisible by 10, the card number is valid.


a. (10 point) 

Define a function 

luhnDouble :: Int -> Int

that doubles a digit and subtracts 9 if the result is greater than 9. For 
example:

main> luhnDouble 3
6
main> luhnDouble 6
3


*** Put your answer below. For codes, DO NOT FORGET to add the > symbol.


> luhnDouble x 
>           | 2*x > 9= 2*x - 9
>           | otherwise = 2*x




--------------------------------------------------------------------------------

b. (10 point) Using the function luhnDouble and the integer remainder function 
   mod , define a function luhn :: Int -> Int -> Int -> Int -> Bool that decides 
   if a four-digit  bank card number is valid. For example:

main> luhn 1 7 8 4
True

main> luhn 4 7 8 3
False


*** Put your answer below. For codes, DO NOT FORGET to add the > symbol.


> luhn :: Int -> Int -> Int -> Int -> Bool
> luhn a b c d 
>     | sum [ luhnDouble a, b, luhnDouble c, d ] `mod` 10 == 0 = True
>     | otherwise = False



--------------------------------------------------------------------------------

c. (Total: 15 point) Blackbox tests

i. (6 point)

Create two cases for testing the function luhn. Two of them should return True 
and the remaining two cases should return False. State the four cases below:

case 1:  Input:    luhn 2 2 2 2
         Expected output: False


case 2:  Input:    luhn 7 6 5 8
         Expected result: True


case 3:  Input:    luhn 1 2 3 4
         Expected result: False


case 4:  Input:    luhn 5 6 7 8
         Expected result:  True



ii. (6 point)

By following the templates given in the file 

egHUnit.lhs

(discussed in class), incorporate the four test cases you have introduced in 
part i (with the tools given in HUnit) to verify the luhn function. Put the 
testing code in the space below: 


> testcase1 = TestCase (assertEqual "for: luhn 2 2 2 2" False (luhn 2 2 2 2))
> testcase2 = TestCase (assertEqual "for: luhn 7 6 5 8" True (luhn 7 6 5 8))
> testcase3 = TestCase (assertEqual "for: luhn 1 2 3 4" False (luhn 1 2 3 4))
> testcase4 = TestCase (assertEqual "for: luhn 5 6 7 8" True (luhn 5 6 7 8))


> List_of_text_cases = TestList [testcase1, testcase2, testcase3, testcase4]



(3 point) Discuss the results of testing (that are printed on the screen) in the
space provided:

Testcases run by: Test.HUnit package 
Resulted obtained: 
*Main> runTestTT List_of_text_cases
Cases: 4  Tried: 4  Errors: 0  Failures: 0
Counts {cases = 4, tried = 4, errors = 0, failures = 0}


Observations after execution:
Results are solely dependent on the number's operation and divisibility by 10
After performing the operations on the numbers booleans are returned, Examples can be seen below:

testcase1 = TestCase (assertEqual "for: luhn 2 2 2 2" False (luhn 2 2 2 2))
testcase2 = TestCase (assertEqual "for: luhn 7 6 5 8" True (luhn 7 6 5 8))
testcase3 = TestCase (assertEqual "for: luhn 1 2 3 4" False (luhn 1 2 3 4))
testcase4 = TestCase (assertEqual "for: luhn 5 6 7 8" True (luhn 5 6 7 8))

Outputs:
*Main> runTestTT List_of_text_cases
Cases: 4  Tried: 4  Errors: 0  Failures: 0
Counts {cases = 4, tried = 4, errors = 0, failures = 0}


Thus, HUnit testing helps to test the list of testcases for a luhn function.


--------------------------------------------------------------------------------

Problem 3  (Total: 40 point)  Set operations with specifications

Recall that we have outlined how to create a Haskell module. In particular, you  
have observed in a demo on developing/using a module for sets. Sets are basic 
mathmatical objects (as data structures) we use to further create more complex 
mathematical objects (as data structures). In this exercise, we will use a list 
to represent a set and implement functions to perform basic set operations. 
Note that Sets should be an instance of the class Eq.


(a)  (20 point) To prepare our implementation of Sets, we will first implement 
the function 

rmdup. It is of type:

rmdup :: (Eq a) => [a] -> [a]

This function will remove all the duplicates of a list. For example:

*Main> rmdup [1,3,5,2,4,6,2,3,5]
[1,4,6,2,3,5]

Note that there is no requirement regarding the order of the elements after 
applying the function redup.

*** Put your answer below. For codes, DO NOT FORGET to add the > symbol.




> rmdup :: (Eq a) => [a] -> [a]
> rmdup [] = []
> rmdup (x : xs) | x `elem` xs = rmdup xs | otherwise = x : rmdup xs     




--------------------------------------------------------------------------------


(b)  (20 point) Implement the union function (named as union1)

The union function returns the list union of the two lists. For 
example,

main> "dog" `union1` "cow"
"dogcw"

Duplicates, and elements of the first list, are removed from the second list, 
but if the first list contains duplicates, so will the result. 

*** Put your answer below. For codes, DO NOT FORGET to add the > symbol.


> union1 :: Eq (a) => [a] -> [a] -> [a]
> union1 f [] = f
> union1 fs (x:xs) | x `elem` fs = union1 fs xs | otherwise = union1 (fs++[x]) xs





--------------------------------------------------------------------------------


Problem 4  (Total: 30 point)


In this question, we follow the definition given in ACST (page 11). That is, a 
the binary relation is a subset of the set A X B (X stands for cartesion 
product. In this question:

We represent a binary relation S as 

S :: (Eq a, Eq b) => [(a,b)]        ..... (*)

For example, the following list r:

r :: [(Int, Char)]
r =  [( 1, 'a'), ( 2, 'b'), ( 3, 'b'), (3, 'c')] 

is a relation from Int to Char.


a. (15 point) 

Write a operator o to implement the composition of relations (ACST,p.11).
For example, if q and r are relations:


q :: [(Float, Int)]
q =  [( 1.0, 1), ( 2.0, 3), ( 3.0, 3), ( 4.0, 4)] 

and 

r :: [(Int, Char)]
r =  [( 1, 'a'), ( 2, 'b'), ( 3, 'b'), (3, 'c')] 


Then 

q o r = [(1.0, 'a'), ( 2.0, 'b'), (2.0, 'c'), (3.0, 'b'), (3.0, 'c')]

*** Put your answer below. For codes, DO NOT FORGET to add the > symbol.


> q =  [(1.0, 1), (2.0, 3), (3.0, 3), (4.0, 4)] 
> r =  [(1, 'a'), (2, 'b'), (3, 'b'), (3, 'c')] 
> (#) :: Eq y => [(x,y)] -> [(y,z)] -> [(x,z)]
> (#) xs ys = [(p, s) | (p,q) <- xs, (r,s) <- ys, q == r]

Testcase1:
Input: q # r
Expected : [(1.0,'a'),(2.0,'b'),(2.0,'c'),(3.0,'b'),(3.0,'c')]
Output:
*Main> q # r
[(1.0,'a'),(2.0,'b'),(2.0,'c'),(3.0,'b'),(3.0,'c')]


--------------------------------------------------------------------------------


b.  (15 point)

Write a function which computes the image of R under a (ACST,p.12), where R 
is a relation from A to B and a is an element of A based on the representation 
specified in (*).

*** Put your answer below. For codes, DO NOT FORGET to add the > symbol.


> compute_image :: (Eq a) => a -> [(a, a)] -> [a]     
> compute_image x xs = rmdup [ q | (p, q) <- xs, x == p ]     

Testcase1:
Input: compute_image 2 [(1,2), (3,4), (2,3), (5,6), (3,2)]
Expected : [3]
Output:
*Main> compute_image 2 [(1,2), (3,4), (2,3), (5,6), (3,2)]
[3]

--------------------------------------------------------------------------------



