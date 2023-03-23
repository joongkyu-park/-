class Solution {
    func longestSubsequence(_ arr: [Int], _ difference: Int) -> Int {
        var dic: Dictionary<Int, [Int]> = [:]
        var dp = Array(repeating: 1, count: arr.count)
        for i in 0..<arr.count {
            let cur = arr[i]
            if let curIndices = dic[cur] {
                dic[cur] = curIndices + [i]
            }
            else {
                dic[cur] = [i]
            }

            let pre = cur - difference
            guard let indices = dic[pre] else { continue }
            var lastIndex = -1
            for index in indices.reversed() {
                if index == i { continue }
                else {
                    lastIndex = index
                    break
                }
            }
            if lastIndex == -1 { continue }
            dp[i] = dp[lastIndex] + 1
        }
        return dp.max()!
    }
}
