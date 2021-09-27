/*
 참고
 https://yabmoons.tistory.com/143
 */
import Foundation

let n = Int(readLine()!)!

var input = readLine()!.split(separator: " ").map{Int($0)!}

var dpInc = [Int](repeating: 1, count: n+1)
var dpDec = [Int](repeating: 1, count: n+1)

for i in 1...n{
    for j in 1...i{
        if input[i-1] > input[j-1] {
            dpInc[i] = dpInc[i] > dpInc[j]+1 ? dpInc[i] : dpInc[j]+1
        }
    }
}
for i in (1...n).reversed(){
    for j in (i...n).reversed(){
        if input[i-1] > input[j-1] {
            dpDec[i] = dpDec[i] > dpDec[j]+1 ? dpDec[i] : dpDec[j]+1
        }
    }
}

var dp = [Int](repeating: 1, count: n+1)

for i in 1...n{
    dp[i] = dpInc[i] + dpDec[i] - 1
}

var max = 0
for i in 1...n{
    if max < dp[i] {
        max = dp[i]
    }
}

print(max)
