// https://katfun.tistory.com/119

import Foundation

let n = Int(readLine()!)!

var arr = [Int]()
for _ in 0..<n {
    arr.append(Int(readLine()!)!)
}

var dp = Array(repeating: Array(repeating: 0, count: n), count: n)

func getDP(_ l: Int, _ r: Int, _ count: Int) -> Int {
    if l > r { return 0 }
    if dp[l][r] != 0 { return dp[l][r] }
    
    dp[l][r] = max(getDP(l+1, r, count+1) + count*arr[l], getDP(l, r-1, count+1) + count*arr[r])
    return dp[l][r]
}

print(getDP(0 ,n-1, 1))
