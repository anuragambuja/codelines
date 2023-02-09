# https://www.hackerrank.com/challenges/30-binary-numbers/problem

"""
Objective
Today, we're working with binary numbers. Check out the Tutorial tab for learning materials and an instructional video!

Task
Given a base- integer, , convert it to binary (base-). Then find and print the base- integer denoting the maximum number of consecutive 's in 's binary representation.

Input Format

A single integer, .

Constraints

Output Format

Print a single base- integer denoting the maximum number of consecutive 's in the binary representation of .

Sample Input 1

5
Sample Output 1

1
Sample Input 2

13
Sample Output 2

2
Explanation

Sample Case 1:
The binary representation of  is , so the maximum number of consecutive 's is .

Sample Case 2:
The binary representation of  is , so the maximum number of consecutive 's is .

"""

# sol 1:
#!/bin/python3

if __name__ == '__main__':
    n = int(input())
    mcount= count=0
    while n>0:
        if n%2 == 1:
            count +=1
            if mcount < count:
                mcount = count
        else:
            count=0
        n = n//2

    print(mcount)
    
# sol 2:
import re
print(len(max(re.findall(r'1+',bin(int(input().strip()))[2:]))))

