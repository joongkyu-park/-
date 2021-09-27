/*
 참고
 https://yabmoons.tistory.com/128
 https://lmcoa15.tistory.com/64
 https://hu-coding.tistory.com/28
 */
import Foundation

var input = readLine()!.split(separator: " ").map{Int($0)!}

var n = input[0]
var k = input[1]

var dp = [[Int]](repeating: Array(repeating: -1, count: n+1), count: k+1)

for i in 0...n {
    dp[0][i] = 0
    dp[1][i] = 1
}

if k>=2{
    for i in 2...k {
        for j in 0...n{
            var sum = 0
            for k in 0...j{
                sum = (sum + dp[i-1][k])%1000000000
            }
            dp[i][j] = sum
        }
    }
}

print(dp[k][n])
