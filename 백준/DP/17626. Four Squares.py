n = int(input())
dp = [0] * (n+1)
dp[1] = 1

for i in range(2, n+1):
    if int(i ** 0.5) ** 2 == i:
        dp[i] = 1
        continue

    j = 1
    minValue = 1e9
    while j ** 2 <= i:
        minValue = min(minValue, dp[i - (j ** 2)])
        j += 1
    dp[i] = minValue + 1

print(dp[n])
