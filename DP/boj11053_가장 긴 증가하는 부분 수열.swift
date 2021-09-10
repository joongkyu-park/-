/*
 참고
 https://velog.io/@skkfea07/%EB%B0%B1%EC%A4%80-%EA%B0%80%EC%9E%A5-%EA%B8%B4-%EC%A6%9D%EA%B0%80%ED%95%98%EB%8A%94-%EB%B6%80%EB%B6%84-%EC%88%98%EC%97%B411053
 https://namu.wiki/w/%EC%B5%9C%EC%9E%A5%20%EC%A6%9D%EA%B0%80%20%EB%B6%80%EB%B6%84%20%EC%88%98%EC%97%B4
 
 */
import Foundation

var n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int($0)!}
var dp = [Int](repeating: 1, count: n)

for i in 0..<n {
    for j in 0..<i {
        if arr[i] > arr[j] {
            dp[i] = dp[i] > dp[j]+1 ? dp[i]:dp[j]+1
        }
    }
}

var max = -1

for i in 0..<n{
    if max < dp[i] {
        max = dp[i]
    }
}
print(max)


