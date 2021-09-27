import Foundation

var n = Int(readLine()!)!

var dp = [[Int]](repeating: Array(repeating: -1, count: 4), count: n+1)

dp[1][0] = 1
dp[1][1] = 1
dp[1][2] = 1
dp[1][3] = 3

if n>=2 {
    for i in 2...n{
        dp[i][0] = (dp[i-1][0] + dp[i-1][1] + dp[i-1][2]) % 9901
        dp[i][1] = (dp[i-1][0] + dp[i-1][2] ) % 9901
        dp[i][2] = (dp[i-1][0] + dp[i-1][1] ) % 9901
        dp[i][3] = (dp[i][0] + dp[i][1] + dp[i][2]) % 9901
    }
}

print(dp[n][3])
