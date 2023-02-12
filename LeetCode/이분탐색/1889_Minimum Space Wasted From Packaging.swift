import Foundation

class Solution {
    func minWastedSpace(_ packages: [Int], _ boxes: [[Int]]) -> Int {
        let mod = Int(1e9 + 7)
        var result = -1
        let sortedPackages = packages.sorted()
        let sum = sortedPackages.reduce(0) { $0 + $1 }
        
        for box in boxes {
            let sortedBox = box.sorted()
            if sortedPackages[sortedPackages.count-1] > sortedBox[sortedBox.count-1] { continue }
            
            var (i, j) = (0, 0)
            var cur = 0
            for curBox in sortedBox {
                j = binarySearch(sortedPackages, curBox + 1)
                cur += curBox * (j - i)
                i = j
            }
            if result == -1 {
                result = cur
            }
            else {
                result = min(result, cur)
            }
        }
        
        if result == -1 { return result }
        return ( result - sum ) % mod
    }
    
    func binarySearch(_ packges: [Int], _ box: Int) -> Int {
        var l = 0
        var r = packges.count
        
        while l < r {
            let m = (l + r) / 2
            if packges[m] < box {
                l = m + 1
            }
            else {
                r = m
            }
        }
        return l
    }
}
