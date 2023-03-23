class Solution {

    func numberOfArrays(_ s: String, _ k: Int) -> Int {
        let s = Array(s).map { String($0) }
        var dp = Array(repeating: -1, count: s.count)
        
        return dfs(s, Double(k), 0, &dp)
    }
    
    func dfs(_ s: [String], _ k: Double, _ i: Int, _ dp: inout [Int]) -> Int {
        if i == s.count {
            return 1
        }
        if s[i] == "0" {
            return 0
        }
        if dp[i] != -1 {
            return dp[i]
        }
        var ans = 0
        var num = 0.0
        for j in i..<s.count {
            num = num * 10 + Double(s[j])!
            if num > k { break }
            ans += dfs(s, k, j + 1, &dp)
            ans %= 1000000007
        }
        dp[i] = ans
        return dp[i]
    }
    
}
