let n = Int(readLine()!)!

let rocks = readLine()!.split(separator: " ").map { Int($0)! }
var dp = Array(repeating: Int.max, count: n)
dp[0] = 0

for i in 0..<n {
    if (i+1) >= n { continue }
    for j in i+1..<n {
        let curValue = (j-i)*(1+Int(abs(Double(rocks[i])-Double(rocks[j]))))
        if dp[i] > dp[j] { continue }
        if dp[j] < curValue { continue }
        dp[j] = max(dp[i], curValue)
    }
}

print(dp[n-1])
