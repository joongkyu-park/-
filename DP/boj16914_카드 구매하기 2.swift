import Foundation

let n = Int(readLine()!)!
let prices: [Int] = readLine()!.split(separator: " ").map{Int($0)!}

var dp = [Int](repeating: -1, count: n+1)
dp.append(-1)
for i in 1...n{
    if i == 1 {
        dp[i] = prices[0]
    }
    else if i == 2{
        dp[i] = min(prices[1], prices[0]*2)
    }
    else {
        dp[i] = prices[i-1]
        for j in i/2..<i{
            if dp[i] > dp[j] + dp[i-j]{
                dp[i] = dp[j] + dp[i-j]
            }
        }
    }
}

print(dp[n])


