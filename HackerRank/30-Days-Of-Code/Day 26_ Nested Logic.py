# https://www.hackerrank.com/challenges/30-nested-logic/problem

"""

Objective
Today's challenge puts your understanding of nested conditional statements to the test. You already have the knowledge to complete this challenge, but check out the Tutorial tab for a video on testing!

Task
Your local library needs your help! Given the expected and actual return dates for a library book, create a program that calculates the fine (if any). The fee structure is as follows:

If the book is returned on or before the expected return date, no fine will be charged (i.e.: .
If the book is returned after the expected return day but still within the same calendar month and year as the expected return date, .
If the book is returned after the expected return month but still within the same calendar year as the expected return date, the .
If the book is returned after the calendar year in which it was expected, there is a fixed fine of .
Input Format

The first line contains  space-separated integers denoting the respective , , and  on which the book was actually returned.
The second line contains  space-separated integers denoting the respective , , and  on which the book was expected to be returned (due date).

Constraints

Output Format

Print a single integer denoting the library fine for the book received as input.

Sample Input

9 6 2015
6 6 2015
Sample Output

45
Explanation

Given the following return dates:
Actual: 
Expected: 

Because , we know it is less than a year late.
Because , we know it's less than a month late.
Because , we know that it was returned late (but still within the same month and year).

Per the library's fee structure, we know that our fine will be . We then print the result of  as our output.

"""

# Sol 1:

# Enter your code here. Read input from STDIN. Print output to STDOUT
d1,m1,y1=map(int,input().split())
d2,m2,y2=map(int,input().split())

if int(str(y1)+str(m1).zfill(2)+str(d1).zfill(2)) <= int(str(y2)+str(m2).zfill(2)+str(d2).zfill(2)):
    print(0)
elif (y1==y2) and (m1==m2):
    print((d1-d2)*15)
elif (y1==y2) and (m1>m2):
    print((m1-m2)*500)
else:
    print(10000)
    
# Sol 2:

rdate=list(map(int,input().split()))
edate=list(map(int,input().split()))
if rdate[2] > edate[2]:
    print(10000)
elif (rdate[1] > edate[1]) and (rdate[2] == edate[2]):
    print(500*(rdate[1]-edate[1]))
elif (rdate[0] > edate[0]) and (rdate[2] == edate[2]) and (rdate[1] == edate[1]):
    print(15*(rdate[0]-edate[0]))
else:
    print(0) 




