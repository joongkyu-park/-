/*
 참고
 https://yabmoons.tistory.com/512
 */
import Foundation

let n = Int(readLine()!)!

var wine = [Int](repeating: 0, count: n+1)

for i in 1...n{
    let input = Int(readLine()!)!
    wine[i] = input
}

var dp = [Int](repeating: 0, count: n+1)

dp[1] = wine[1]


if n>=2{
    dp[2] = dp[1] + wine[2]
}

if n>=3 {
    for i in 3...n{
        dp[i] = max(dp[i-2] + wine[i], dp[i-3] + wine[i-1] + wine[i])
        dp[i] = max(dp[i-1], dp[i])
    }
}

print(dp[n])

