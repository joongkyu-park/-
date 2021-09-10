import Foundation

var n = Int(readLine()!)!

var dp = [[Int]](repeating: Array(repeating: 0, count: 2), count: 91)

dp[1][0] = 0
dp[1][1] = 1

for i in 2...90 {
    dp[i][0] = dp[i-1][0] + dp[i-1][1]
    dp[i][1] = dp[i-1][0]
}

print(dp[n][0]+dp[n][1])
