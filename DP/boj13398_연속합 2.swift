/*
 참고
 https://seol-limit.tistory.com/46
 */
import Foundation

let n = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map{Int($0)!}

var dp = [[Int]](repeating: Array(repeating: 0, count: 2), count: n)

dp[0][0] = input[0]
dp[0][1] = input[0]
var ans = input[0]

if n>=1 {
    for i in 1..<n {
        dp[i][0] = max(dp[i-1][0]+input[i], input[i])
        dp[i][1] = max(dp[i-1][0], dp[i-1][1] + input[i])
        ans = max(dp[i][0],dp[i][1],ans)
    }
}
print(ans)
