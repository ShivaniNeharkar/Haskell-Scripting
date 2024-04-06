--------------------------------------------------------------------------------
CIS 623 Structured programming and formal methods

Fall 2022

Homework 00  Functional programming: beginning steps

-------------------------------------------------------------------------------

> import Prelude hiding (init)

Total points: 120 

-------------------------------------------------------------------------------


(10 point) Fill in the following information. You will lose 3 point for each 
missing or incorrect answer.

Name: Shivani Anil Neharkar

Email: sanehark@syr.edu

Number: 519

ie. The 3 digit number assigned to you

-------------------------------------------------------------------------------

Due date:

Release:        Sep 08, 2022 
Due date:       Sep 15, 2022, 11:59 pm

Remarks:

1. (5 point) You submission should be named as XXX-hw00.lhs where XXX is the 3 
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

   when email is available. Your grader will not
   grade your work but you may receive an exemption.

--------------------------------------------------------------------------------

Note:

To answer the programming questions, add the haskell code according to the
requirement. DO NOT FORGET to add the > symbol below each line in your code.

--------------------------------------------------------------------------------
Problems
--------------------------------------------------------------------------------

Problem 1 (Total 25 point)

Consider the following function:

> fac   :: Integer -> Integer 
> fac 0 = 1               -- fac.1
> fac n = n * fac (n-1)   -- fac.2

a. (10 point)  Evaluate 

fac 4 

and display the steps using Feijen's notation.

Answer: 
fac 4
={fac.2}
4 * fac 3
={fac.2}
4 * 3 * fac 2
={fac.2}
4 * 3 * 2 * fac 1
={fac.2}
4 * 3 * 2 * 1 * fac 0
={fac.1}
4 * 3 * 2 * 1 * 1
={apply *}
24


--------------------------------------------------------------------------------

b. (5 point) Run GHCi and evaluate the expression

fac 26

Copy your answer and paste it in the space below.

Answer:

403291461126605635584000000

--------------------------------------------------------------------------------

c.  (5 point)  Consider the following function fac1:

> fac1   :: Int -> Int 
> fac1 0 = 1
> fac1 n = n * fac1 (n-1) 

Run GHCi and evaluate the expression

fac1 26

Copy your answer and paste it in the space below.

Answer:
-1569523520172457984



--------------------------------------------------------------------------------

d. (5 point)  Is your answer to part b and c the same ? Give
reason(s) to support your answer.

Answer: 

No, the answer to part b and c is not same, primarily because of the change in data types.

1. Integer : This data type holds any number that a machine can remember meaning it can hold arbitrary large number.
2. Int : This data type is bounded to a range, mainly ranging from -2^29 .... 2^29-1 

Hence, fac 26 and fac1 26 gives two different answers because of the holding capacities of the data types.Incase of fac1 26 overflow of data type (integer overflow) is observed.


--------------------------------------------------------------------------------

Problem 2 (Total 15 point)

Consider the cons operation (:), where we use it to build lists. 

a. (5 point) Use GHCi to determine the type of (:) (the cons operation) and 
write your answer below.

Answer: 

*Main> :t (:)
(:) :: a -> [a] -> [a]

--------------------------------------------------------------------------------


b. (5 point) Explain why the following expression

[1,2]:[1,2]

is not a well defined Haskell expression.


Answer:
[1,2]:[1,2] is not a well defined Haskell expression because:
1.Cons is an operator which prepends the elements to the list.
2.The elements inside the list have to be of same type of the elements which are getting prepended. 
3.Examples:
[1:2]:[1,2] wont get prepended as the elements inside the list are 1,2 which are integers. 
Inorder to prepend integers to the list correct syntax would be- 1:2:[1,2] -> [1,2,1,2]
Inorder to prepend list[1,2] to the list correct syntax would be- [1,2]:[[1,2]] -> [[1,2],[1,2]]

--------------------------------------------------------------------------------


c.  (5 point) Is 

[]:[] 

a legitimate Haskell expression ?  Give reason(s) to support your answer.


Answer: *Main> :t []
[] :: [a]
 
Therefore yes, the expression is legitimate and in this example the type of [] is list and cons operator can prepended it in the list making it as list of lists.

After Execution :
[]:[]
[[]]


--------------------------------------------------------------------------------

Problem 3 (Total 35 point)

Consider the following function transfer:
 
> transfer         :: ([a],[a]) -> ([a],[a])
> transfer ([],ys)     = ([],ys)    -- transfer.1
> transfer ((x:xs),ys) = transfer (xs,(x:ys))  -- transfer.2

a).  (10 point)  Evaluate the expression

transfer ([1,2],[3])

display the steps using Feijen's notation.

Answer:


([1,2],[3])
={transfer.2}
transfer([2],[1,3])
={transfer.2}
transfer([],[2,1,3])
={transfer.1}
([],[2,1,3])



--------------------------------------------------------------------------------

b). Use the transfer function, together with another function written by you to 
    implement the reverse function. Create two test cases to verify your code.

Answer:

> reverse_transfer :: [a]->[a] 
> reverse_transfer a = snd(transfer(a,[])) --reverse_transfer.1

(15 point) Implementation:

reverse_transfer [1,2,3]
={reverse_transfer.1}
snd(transfer(a,[]))
={transfer.2}
transfer ([1,2,3],[])
={transfer.2}
transfer ([1,2],[3])
={transfer.2}
transfer ([1],[3,2])
={transfer.2}
transfer ([],[3,2,1])
={transfer.1}
([],[3,2,1])
={reverse_transfer.1}
snd([],[3,2,1])
={reverse_transfer.1} 
[3,2,1]





Test Cases:


(5 point) Case 1:  

Test 1 Input: [1,2,3,4,5,6]

Expected result:[6,5,4,3,2,1]

Test Run:
*Main> reverse_transfer[6,5,4,3,2,1]
[1,2,3,4,5,6]


(5 point) Case 2:  

Test 2 Input: [0,9,8]

Expected result:[8,9,0]

Test Run:*Main> reverse_transfer[0,9,8]
[8,9,0]


Remarks:  Thus, reverse_transfer function takes list as input and returns the list in reverse. This reverse_transfer function uses transfer function internally.

Example: Test cases preparation

Suppose you compose an alternative version of the length function 
(as defined in Prelude). You may create the following tests:

 
(Mock Test 1) 

Test 1 Input: []

Expected result: 0

Test Run:

*Main> length []
0

(Mock Test 2) 

Test 1 Input: [1,2,3]

Expected result: 3

Test Run:

*Main> length [1,2,3]
3

--------------------------------------------------------------------------------

Problem 4 (Total 20 point)

a. (20 point)  In your own words, describe blackbox testing in the context of 
software testing methodology. Do not use more than 100 words.

One of the type of testing is blackbox testing. The differentiating factor in blackbox testing are the following:
i) Person performing Blackbox testing has no access to the source code. It compulsorily is based on the functionalites of the program.
ii) All the possible inputs are provided by the blackbox tester to see any errors or malfunctioning of program.
iii) Blackbox tester will not have any knowledge about the algorithms, architecture, internal paths, language of code, implementation details, etc about the source code. 
iv) Main components of the testing are the inputs and the outputs of the program.
v) Blackbox tester has to make sure if all the software requiremnets are fulfilled by the application and there aren't any erroneos behaviour by the appliaction.
vi) All the testcases are tested including the positive and negative testcases and it is made sure that the output matches the Expected output.






b. (10 point) Give an example that you will use blackbox testing, where the 
underlying programming language is not a functional language.


code: Language C++

using namespace std;
int main()
{   int num,a,b;
    do{
    cout<<"\nPick Action:\n1.Addition\n2.Subtraction\n";
    cin>>num;
    if(num<0||num>2){"Invalid input";continue;}
    else if (num==1){cout<<"Enter two numbers : ";
    cin>>a;
    cin>>b;
    cout<<"Answer= "<<a+b<<endl;}
    else{cout<<"Enter two numbers : ";
    cin>>a;
    cin>>b;
    cout<<"Answer= "<<a-b<<endl;}
    cout<<"Press 0 to exit : ";
    cin>>num;
    }while(num!=0);
   
}


Remarks:

In the above code if we perform black box testing we can test it for the following testcases:

Testcase 1: Enter 1 as first input  -> Enter 2 -> Enter 3 
	    Expected output: 5
	    Output:Answer= 5
	    ->Enter 1 to continue
Testcase 2: Enter 2 as first input  -> Enter 10 -> Enter 2
	    Expected output: 8
	    Output:Answer= 8
	    ->Enter 1 to continue
Testcase 3: Enter -9 as first input
	    Expected output: Invalid input
	    Output: Invalid input
	    ->Enter 1 to continue
Testcase 4: run testcase 1
	    ->Enter 0 to exit
	    Expected Output: Program should terminate
	    Output: Program Terminates.





If you prefer, you may watch an online video you find useful regarding blackbox
testing and give a summary (includes a link to the video) as the answer to the 
first part of this question.

In the second part of this question, please refer to the language you are most 
familiar with.  


--------------------------------------------------------------------------------
End of Homework 00 submission
--------------------------------------------------------------------------------
