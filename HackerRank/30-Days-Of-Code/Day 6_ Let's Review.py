# https://www.hackerrank.com/challenges/30-review-loop/problem

"""
Objective
Today we're expanding our knowledge of Strings and combining it with what we've already learned about loops. Check out the Tutorial tab for learning materials and an instructional video!

Task
Given a string, , of length  that is indexed from  to , print its even-indexed and odd-indexed characters as  space-separated strings on a single line (see the Sample below for more detail).

Note:  is considered to be an even index.

Input Format

The first line contains an integer,  (the number of test cases).
Each line  of the  subsequent lines contain a String, .

Constraints

Output Format

For each String  (where ), print 's even-indexed characters, followed by a space, followed by 's odd-indexed characters.

Sample Input

2
Hacker
Rank
Sample Output

Hce akr
Rn ak
Explanation

Test Case 0: 






The even indices are , , and , and the odd indices are , , and . We then print a single line of  space-separated strings; the first string contains the ordered characters from 's even indices (), and the second string contains the ordered characters from 's odd indices ().

Test Case 1: 




The even indices are  and , and the odd indices are  and . We then print a single line of  space-separated strings; the first string contains the ordered characters from 's even indices (), and the second string contains the ordered characters from 's odd indices ().

"""
# sol1:

for i in range(int(input())):
    s=input().strip()
    print(s[0::2],s[1::2])
    
# sol 2:
for _ in range(int(input())):
    name = input()
    for i in range(0,len(name),2):
        print(name[i],sep='',end='')
    print(' ',end='')
    for i in range(1,len(name),2):
        print(name[i],sep='',end='')
    print()

# sol 3:
n=int(input())
for i in range(n):
	s=input().strip()
	print(*[s[i] for i in range(0,len(s),2)],sep='',end=' ')
	print(*[s[j] for j in range(1,len(s),2)],sep='')
