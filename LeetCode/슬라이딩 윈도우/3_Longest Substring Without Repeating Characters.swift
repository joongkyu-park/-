class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let arr = Array(s).map { String($0) }
        if arr.count == 0 { return 0 }
        var firstIndex = 0
        var lastIndex = 1
        var maxCount = 0
        var curCount = 0
        var charSet = Set<String>()
        charSet.insert(arr[firstIndex])
        while lastIndex < arr.count {
            let char = arr[lastIndex]
            if charSet.contains(char) {
                curCount = lastIndex - firstIndex
                if maxCount < curCount {
                    maxCount = curCount
                }
                while arr[firstIndex] != char {
                    charSet.remove(arr[firstIndex])
                    firstIndex += 1
                }
                firstIndex += 1
                lastIndex += 1
                continue
            }
            charSet.insert(char)
            lastIndex += 1
        }
        curCount = lastIndex - firstIndex
        if maxCount < curCount {
            maxCount = curCount
        }
        return maxCount
    }
}
