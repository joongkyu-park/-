import Foundation

class Solution {
    
    func maxSum(_ grid: [[Int]]) -> Int {
        
        let n = grid.count
        let m = grid.first!.count
        
        func hourglass(startCoord: (Int, Int)) -> Int? {
            
            let r = startCoord.0
            let c = startCoord.1
            
            if false == ((0..<n).contains(r+2) && (0..<m).contains(c+2)) {
                return nil
            }
            
            var sum = 0
            for i in c...c+2 {
                sum += grid[r][i]
                sum += grid[r+2][i]
            }
            sum += grid[r+1][c+1]
            
            return sum
            
        }
        
        var result = 0
        
        for r in 0..<n {
            for c in 0..<m {
                let coord = (r, c)
                let sum = hourglass(startCoord: coord)
                guard let sum = sum else { continue }
                if sum > result {
                    result = sum
                }
            }
        }
        
        return result
        
    }

}
