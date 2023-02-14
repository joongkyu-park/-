class Solution {
    
    func maximumTop(_ nums: [Int], _ k: Int) -> Int {
        
        if k == 0 {
            return nums.first!
        }
        
        if nums.count == 1 {
            if k % 2 == 0 {
                return nums.first!
            }
            else {
                return -1
            }
        }
        
        var max = -1
        if k < nums.count {
            for i in 0..<k-1 {
                if max < nums[i] {
                    max = nums[i]
                }
            }
            if max < nums[k] {
                return nums[k]
            }
            else {
                return max
            }
        }
        else if k == nums.count {
            for i in 0..<k-1 {
                if max < nums[i] {
                    max = nums[i]
                }
            }
            return max
        }
        else {
            for i in 0..<nums.count {
                if max < nums[i] {
                    max = nums[i]
                }
            }
            return max
        }
    }
    
}
