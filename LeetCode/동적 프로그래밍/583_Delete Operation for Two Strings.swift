import Foundation
// https://www.dalecoding.com/problems/delete-operation-for-two-strings

// 방법 1(재귀, 메모이제이션, Top-down)
class Solution1 {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let n = word1.count
        let m = word2.count
        let word1 = Array(word1).map { String($0) }
        let word2 = Array(word2).map { String($0) }
        var dp = Array(repeating: Array(repeating: -1, count: m+1), count: n+1)
        
        func search(_ i: Int, _ j: Int) -> Int {
            if i == n {
                return (m - j)
            }
            if j == m {
                return (n - i)
            }
            
            if word1[i] == word2[j] {
                if dp[i+1][j+1] == -1 {
                    dp[i+1][j+1] = search(i + 1, j + 1)
                }
                return dp[i+1][j+1]
            }
            
            if dp[i][j+1] == -1 {
                dp[i][j+1] = search(i, j + 1)
            }
            if dp[i+1][j] == -1 {
                dp[i+1][j] = search(i + 1, j)
            }
            return 1 + min(dp[i][j+1], dp[i+1][j])
        }
        
        return search(0, 0)
    }
}

// 방법 2(DP, Bottom-up)
class Solution2 {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let n = word1.count
        let m = word2.count
        let word1 = Array(word1).map { String($0) }
        let word2 = Array(word2).map { String($0) }
        var dp = Array(repeating: Array(repeating: 0, count: m+1), count: n+1)
        
        for i in 0...m {
            dp[0][i] = i
        }
        for i in 0...n {
            dp[i][0] = i
        }
        
        for i in 1...n {
            for j in 1...m {
                if word1[i-1] == word2[j-1] {
                    dp[i][j] = dp[i-1][j-1]
                }
                else {
                    dp[i][j] = 1 + min(dp[i - 1][j], dp[i][j - 1])
                }
            }
        }
        return dp[n+1][m+1]
    }
}

