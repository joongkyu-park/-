let n = Int(readLine()!)!

var time = Array(repeating: 0, count: n)
var pay = Array(repeating: 0, count: n)
var dp = Array(repeating: 0, count: n+1)

for i in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    time[i] = input[0]
    pay[i] = input[1]
}

for i in 0..<n {
    if i+1 <= n {
        if dp[i+1] < dp[i] {
            dp[i+1] = dp[i]
        }
    }

    if i + time[i] <= n {
        if dp[i+time[i]] < dp[i]+pay[i] {
            dp[i+time[i]] = dp[i]+pay[i]
        }
    }
}

var result = 0
for i in 0...n {
    if result < dp[i] {
        result = dp[i]
    }
}

print(result)
