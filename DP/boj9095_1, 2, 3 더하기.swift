import Foundation

var t = Int(readLine()!)!

var dp = [Int](repeating: -1, count: 11)
dp[1] = 1
dp[2] = 2
dp[3] = 4

while t != 0 {
    t -= 1
    let n = Int(readLine()!)!
    
    if n >= 4{
        for i in 4...n {
            dp[i] = dp[i-1] + dp[i-2] + dp[i-3]
        }
    }
    print(dp[n])
}


