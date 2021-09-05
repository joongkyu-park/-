/*
 크기가 2xN인 직사각형을 채울 때 가장 마지막에 붙인 블럭이 1x2 인지 2x1인지에 따라 붙이기 전 블록의 크기를 2xN-2 / 2xN-1로 볼 수 있다.
 */
import Foundation

let n = Int(readLine()!)!

var dp = [Int](repeating: -1, count: n+1)

dp[1] = 1

if n>1 {
    dp[2] = 2
    
    if n>2{
        for i in 3...n {
            dp[i] = (dp[i-1] + dp[i-2]) % 10007
        }
    }
}
print(dp[n] % 10007)
