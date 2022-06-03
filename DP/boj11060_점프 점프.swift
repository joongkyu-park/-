import Foundation

let n = Int(readLine()!)!
let maze = readLine()!.split(separator: " ").map{Int(String($0))!}

var dp = Array(repeating: 0, count: n)

if n == 1 {
    print(0)
}
else {
    for i in 0..<n {
        let num = maze[i]
        
        if num != 0 {
            for j in 1...num {
                if (i+j) < n {
                    if i == 0 {
                        dp[i+j] = dp[i] + 1
                    }
                    else {
                        if dp[i] != 0 {
                            if dp[i+j] == 0 {
                                dp[i+j] = dp[i] + 1
                            }
                            else {
                                dp[i+j] = min(dp[i+j], dp[i]+1)
                            }
                        }
                    }
                }
            }
        }
    }
    
    print(dp[n-1] == 0 ? -1 : dp[n-1])
}
