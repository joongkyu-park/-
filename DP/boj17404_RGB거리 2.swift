/*
 참고
 https://cooling.tistory.com/4
 */
import Foundation

let n = Int(readLine()!)!

var rgb = [[Int]](repeating: Array(repeating: 0, count: 3), count: n+1)
for i in 1...n {
    let arr = readLine()!.split(separator: " ").map{Int($0)!}
    rgb[i][0] = arr[0]
    rgb[i][1] = arr[1]
    rgb[i][2] = arr[2]
}

var dp = [[Int]](repeating: Array(repeating: -1, count: 3), count: n+1)

var ans = 1000 * n + 1

for k in 0...2 {
    for j in 0...2 {
        if j == k {
            dp[1][j] = rgb[1][j]
        }
        else {
            dp[1][j] = 1000 * n + 1
        }
    }
    if n>=2 {
        for i in 2...n {
            dp[i][0] = rgb[i][0] + min(dp[i-1][1], dp[i-1][2])
            dp[i][1] = rgb[i][1] + min(dp[i-1][0], dp[i-1][2])
            dp[i][2] = rgb[i][2] + min(dp[i-1][0], dp[i-1][1])
        }
    }
    for j in 0...2{
        if j == k {
            continue
        }
        else {
            ans = min(ans, dp[n][j])
        }
    }
}
print(ans)
