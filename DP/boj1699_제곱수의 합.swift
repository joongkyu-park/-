/*
 참고
 https://vapor3965.tistory.com/41
 */
import Foundation

var n = Int(readLine()!)!
var cnt = 0
var dp = [Int](repeating: 0, count: n+1)
for i in 0..<dp.count {
    dp[i] = i
}
dp[1] = 1
if n>=2{
    for i in 2...n {
        for j  in 1...Int(sqrt(Double(i))) {
            dp[i] = min(dp[i], dp[i - Int(pow(Double(j),2))]+1)
        }
    }
}
print(dp[n])
