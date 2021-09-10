import Foundation

var n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int($0)!}
var dp = [Int](repeating: -1, count: n)
dp[0] = arr[0]
var max = dp[0]

for i in 1..<n {
    if arr[i] > 0 {
        if dp[i-1] > 0{
            dp[i] = dp[i-1] + arr[i]
        }
        else {
            dp[i] = arr[i]
        }
        max = max > dp[i] ? max : dp[i]
    }
    else {
        max = max > dp[i-1] ? max : dp[i-1]
        max = max > arr[i] ? max : arr[i]
        dp[i] = dp[i-1] + arr[i]
    }
}

print(max)
