import Foundation

let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nm[0]
let m = nm[1]

var maze = [[Int]]()

for _ in 0..<n {
    let row = readLine()!.split(separator: " ").map{Int(String($0))!}
    maze.append(row)
}

var dp = Array(repeating: Array(repeating: 0, count: m), count: n)

dp[0][0] = maze[0][0]
for r in 1..<n {
    dp[r][0] = maze[r][0] + dp[r-1][0]
}
for c in 1..<m {
    dp[0][c] = maze[0][c] + dp[0][c-1]
}

for r in 1..<n {
    for c in 1..<m {
        dp[r][c] = maze[r][c] + max(dp[r-1][c-1], dp[r-1][c], dp[r][c-1])
    }
}

print(dp[n-1][m-1])
