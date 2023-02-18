// k <= i < n-k 의 범위에서 매 순간 체킹하려고하면 TLE

class Solution {
    
    func goodIndices(_ nums: [Int], _ k: Int) -> [Int] {

        let n = nums.count
        var dp1 = Array(repeating: 1, count: n) // i-k ~ i-1, non-increasing
        var dp2 = Array(repeating: 1, count: n) // i+1 ~ i+k, non-decreasing
        
        for i in 1...n-1 {
            if nums[i-1] >= nums[i] {
                dp1[i] = dp1[i-1] + 1
            }
        }
        for i in (1...n-1).reversed() {
            if nums[i-1] <= nums[i] {
                dp2[i-1] = dp2[i] + 1
            }
        }
        
        var result = [Int]()
        for i in k..<(n-k) {
            if (dp1[i-1] >= k) && (dp2[i+1] >= k) {
                result.append(i)
            }
        }
        
        return result
        
    }
    
}
