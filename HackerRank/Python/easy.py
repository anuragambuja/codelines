# 1. Say "Hello, World!" With Python
# https://www.hackerrank.com/challenges/py-hello-world/problem

print("Hello, World!")

# 2. Python If-Else
# https://www.hackerrank.com/challenges/py-if-else/problem
n = int(input().strip())
if n%2 != 0:
    print('Weird')
elif 2 <= n <=5:
    print('Not Weird')
elif 6 <= n <=20:
    print('Weird')
else:
    print('Not Weird')
    
# 3. Arithmetic Operators
# https://www.hackerrank.com/challenges/python-arithmetic-operators/problem
a = int(input())
b = int(input())
print(a+b, a-b, a*b, sep='\n')

# 4. Python: Division
# https://www.hackerrank.com/challenges/python-division/problem
a = int(input())
b = int(input())
print(a//b,a/b,sep='\n')

# 5. Loops
# https://www.hackerrank.com/challenges/python-loops/problem
n = int(input())
for i in range(n):
    print(i*i)

# 6. Print Function
# https://www.hackerrank.com/challenges/python-print/problem
n = int(input())
for i in range(1,n+1):
    print(i,sep='',end='')

# 7. List Comprehensions
# https://www.hackerrank.com/challenges/list-comprehensions/problem
x = int(input())
y = int(input())
z = int(input())
n = int(input())
print([[i,j,k] for i in range(x+1) for j in range(y+1) for k in range(z+1) if i+j+k != n])

# 8. Find the Runner-Up Score!
# https://www.hackerrank.com/challenges/find-second-maximum-number-in-a-list/problem
n = int(input())
arr = map(int, input().split())
print(sorted(set(arr)).pop(-2))

# 9. Nested Lists
# https://www.hackerrank.com/challenges/nested-list/problem
stud = list()
for _ in range(int(input())):
    name = input()
    score = float(input())
    stud.append([name,score])
secmin = sorted(set([x[1] for x in stud])).pop(1)
for n in sorted([x[0] for x in stud if x[1] == secmin]):
    print (n)
    
# 10. Finding the percentage
# https://www.hackerrank.com/challenges/finding-the-percentage/problem
n = int(input())
student_marks = {}
for _ in range(n):
    name, *line = input().split()
    scores = list(map(float, line))
    student_marks[name] = scores
query_name = input()
print("{0:.2f}".format(sum(student_marks[query_name])/len(student_marks[query_name])))

# 11. Lists
# https://www.hackerrank.com/challenges/python-lists/problem
N = int(input())
ls = list()
for _ in range(N):
    val = list(input().split())
    if val[0] == 'insert':
        ls.insert(int(val[1]), int(val[2]))
    elif val[0] == 'print':
        print(ls)
    elif val[0] == 'remove':
        ls.remove(int(val[1]))
    elif val[0] == 'append':
        ls.append(int(val[1]))
    elif val[0] == 'pop':
        ls.pop()
    elif val[0] == 'reverse':
        ls.reverse()
    else:
        ls.sort()

# 12. Tuples
# https://www.hackerrank.com/challenges/python-tuples/problem
n = int(input())
integer_list = tuple(map(int, input().split()))
print(hash(integer_list))

# 13. 

