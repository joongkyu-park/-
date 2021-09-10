/*
 참고 :
 https://dev-wd.github.io/algorithm/backjoon10844/
 https://mygumi.tistory.com/260
 https://yabmoons.tistory.com/22
 */
import Foundation

var n = Int(readLine()!)!

var dp = [[Int]](repeating: Array(repeating: 0, count: 10), count: 101)

for i in 0...9 {
    dp[1][i] = 1
}
dp[1][0] = 0

for i in 2...100{
    for j in 0...9{
        if j == 0{
            dp[i][j] = dp[i-1][j+1] % 1000000000
        }
        else if j == 9{
            dp[i][j] = dp[i-1][j-1] % 1000000000
        }
        else {
            dp[i][j] = (dp[i-1][j-1] + dp[i-1][j+1]) % 1000000000
        }
    }
}

var sum = 0
for i in 0...9{
    sum = (sum + dp[n][i]) % 1000000000
}
print(sum)
