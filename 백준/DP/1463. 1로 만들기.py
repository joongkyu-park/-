n = int(input())
dp = [0] * (n+1)

for i in range(2, n+1):
    v1 = v2 = v3 = 1e9
    if i % 3 == 0:
        v1 = dp[int(i/3)] + 1
    if i % 2 == 0:
        v2 = dp[int(i/2)] + 1
    v3 = dp[i-1] + 1
    dp[i] = min(v1,v2,v3)
print(dp[n])
