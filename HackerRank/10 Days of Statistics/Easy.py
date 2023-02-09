# Day 0: Mean, Median, and Mode
N = input()
nums = sorted(list(map(int, input().split())))
n=len(nums)
print("%.1f"%(sum(nums)/n))
print("%.1f"%(nums[n//2]) if n%2 != 0 else "%.1f"%((nums[n//2]+nums[(n//2)-1])/2))
print(sorted([(nums.count(x),x) for x in set(nums)], key=lambda y:y[0], reverse=True)[0][1])



