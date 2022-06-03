/*
 https://velog.io/@jkh9615/%EC%95%8C%EA%B3%A0%EB%A6%AC%EC%A6%98-%EB%B0%B1%EC%A4%80-15989-1-2-3-%EB%8D%94%ED%95%98%EA%B8%B0-4-Java
 https://sapjilkingios.tistory.com/entry/SwiftDP-%EB%B0%B1%EC%A4%80-15989%EB%B2%88-1-2-3-%EB%8D%94%ED%95%98%EA%B8%B0-4
 */

import Foundation

let t = Int(readLine()!)!

for _ in 0..<t {
    let n = Int(readLine()!)!
    
    if n <= 3 {
        print(n)
        continue
    }
    var dp = Array(repeating: Array(repeating: 0, count: 4), count: n+1)
    
    dp[1][1] = 1
    
    dp[2][1] = 1
    dp[2][2] = 1
    
    dp[3][1] = 1
    dp[3][2] = 1
    dp[3][3] = 1
    
    for i in 4...n {
        dp[i][1] = dp[i-1][1]
        dp[i][2] = dp[i-2][1] + dp[i-2][2]
        dp[i][3] = dp[i-3][1] + dp[i-3][2] + dp[i-3][3]
    }
    print(dp[n][1] + dp[n][2] + dp[n][3])
}
