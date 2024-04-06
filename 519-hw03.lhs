
--------------------------------------------------------------------------------

CIS 623 Structured programming and formal methods

Fall 2022

Homework 03  More on defining functions; Reasoning about Access control logic

-------------------------------------------------------------------------------

> import Prelude 

Total points: 175

-------------------------------------------------------------------------------


(10 point) Fill in the following information. You will lose 3 point for each 
missing or incorrect answer.

Name: Shivani Anil Neharkar

Email: sanehark@syr.edu

Number: 519

ie. The 3 digit number assigned to you

-------------------------------------------------------------------------------

Due date:

Release:        Oct 09, 2022 
Due date:       Oct 16, 2022, 11:59 pm

Remarks:

This homework has two parts. Namely:

Part I:  Formal methods
Part II: Programming 


You will need to turn in Part I and Part II SEPARATELY, using two different 
links from our blackboard site.

For Part I, you will need to 

1. name your submission as a pdf file named XXX-hw03-I.pdf where XXX is the 3 
digit no. assigned to you in blackboard. 

2. To obtain a pdf copy, you are advised to write your answer using letter 
sized paper and scan them (use Library) after completion and use, upload the 
pdf file you obtained you obtained.

For Part II, you will follow the rules as in HW 00. That is:

1. (5 point) You submission should be named as XXX-hw03.lhs where XXX is the 3 
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
Part I: Formal methods (120 point)
--------------------------------------------------------------------------------

All the questions are taken from ACST. For your convenience, the detailed 
description of these problems are printed in the document HW03-Part1.pdf for
your reference.


Problem 1 (Total 30 point)

a. (10 point)    Exercise 2.3.1, part a.
b. (10 point)    Exercise 2.3.1, part d.
c. (10 point)    Exercise 2.3.1, part f.


Problem 2 (Total 40 point)

a. (10 point) Give a graphical representation of the Kripke model in 
              Exercise 2.3.3.
b. (10 point)   Exercise 2.3.3, part b. 
c. (10 point)   Exercise 2.3.3, part d. 
d. (10 point)   Exercise 2.3.3, part e. 


Problem 3 (Total 50 point)

a. (25 point) Exercise 3.2.2.
b. (25 point) Exercise 3.2.4.

--------------------------------------------------------------------------------
Part I: Programming ( point)
--------------------------------------------------------------------------------

Problem 4 (20 point)

Consider the following type and data declarations:

> type ID    = String

> data Role  = Manager | Secretary | Technician
>              deriving Show

They are used to represent the roles of each employee in a department within an
enterprise. For example, the following is a list of tuples, where each tuple 
represents an employee in department d.

> d :: [(ID, Role)] 
> d = [("a1",Manager),("a2",Secretary), ("a3",Technician), ("a4",Technician)]

Write a function organize, which take a lst of type [(ID, Role)] (as in the 
example d just stated), return a three element lst 

[(i, Manager), (j, Secretary), (k, Technician)]

where i (resp. j and k) is the number of Managers (resp. Secretary, Technician) 
in the department.

For example, when applying the the department d above, we get

*Main> organize d
[(1,Manager),(1,Secretary),(2,Technician)]
 
You can write helpers function in your implementation.


Answer:

> count_roles :: [(Int, Role)] -> [(Int, Role)] -> [(Int, Role)]
> count_roles [(x1, Manager), (y1, Secretary), (z1, Technician)] [(x2, Manager), (y2, Secretary), (z2, Technician)] = [((x1+x2), Manager), ((y1+y2), Secretary), ((z1+z2), Technician)]




> organize :: [(ID, Role)] -> [(Int, Role)]
> organize [] = [(0, Manager), (0, Secretary), (0, Technician)]
> organize ((_, Manager):xs)       =   count_roles [(1, Manager), (0, Secretary), (0, Technician)] (organize xs)
> organize ((_, Secretary):xs)     =   count_roles [(0, Manager), (1, Secretary), (0, Technician)] (organize xs)
> organize ((_, Technician):xs)    =   count_roles [(0, Manager), (0, Secretary), (1, Technician)] (organize xs)





--------------------------------------------------------------------------------

Problem 5 (20 point)

Consider the following data declaration:


> data Expr = Sym Char | Concat Expr Expr | Space Expr Expr
>             deriving Eq 

Write the show function for the data type Expr by define it an instance for the 
Show class so that

i.  Concat is the usual string concatenation, and
ii. Space is to add a space between two expressions (of type Expr)


Answer:


> instance Show Expr where
>     show (Sym x) = x : ""
>     show (Space x y) = show x ++ " " ++ show y
>     show (Concat x y) = show x ++ show y


For example, if

> eg1 :: Expr
> eg1 = (Sym 'c') 

> eg2 :: Expr
> eg2 = (Sym 'i')

> eg3 :: Expr
> eg3 = (Sym 's')

> eg4 :: Expr
> eg4 = (Space (Concat eg1 eg2) (Concat eg2 eg3)) 

> eg5 :: Expr
> eg5 = (Concat (Space eg1 eg2) (Space eg2 eg3)) 

then we will get

Input: eg1
Expected: c
Output:
*Main> eg1
c


Input: eg2
Expected: i
Output:
*Main> eg2
i

Input: eg3
Expected: s
Output:
*Main> eg3
s

Input: eg4
Expected: ci is
Output:
*Main> eg4
ci is

Input: eg5
Expected: c ii s
Output:
*Main> eg5
c ii s

