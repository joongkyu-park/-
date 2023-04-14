import Foundation

func solution(_ board:[[Int]], _ skill:[[Int]]) -> Int {
    let n = board.count
    let m = board[0].count
    
    var prefixSum = Array(repeating: Array(repeating: 0, count: m), count: n)
    
    for s in skill {
        var (type, r1, c1, r2, c2, degree) = (s[0], s[1], s[2], s[3], s[4], s[5])
        
        if type == 1 {
            degree = -degree
        }
        prefixSum[r1][c1] += degree
        if (0..<m).contains(c2+1) {
            prefixSum[r1][c2+1] -= degree
        }
        if (0..<n).contains(r2+1) {
            prefixSum[r2+1][c1] -= degree
        }
        if (0..<n).contains(r2+1) && (0..<m).contains(c2+1) {
            prefixSum[r2+1][c2+1] += degree
        }
    }
    for r in 0..<n {
        for c in 1..<m {
            prefixSum[r][c] += prefixSum[r][c-1]
        }
    }
    for c in 0..<m {
        for r in 1..<n {
            prefixSum[r][c] += prefixSum[r-1][c]
        }
    }
    var count = 0
    for r in 0..<n {
        for c in 0..<m {
            prefixSum[r][c] += board[r][c]
            if prefixSum[r][c] > 0 {
                count += 1
            }
        }
    }
    
    return count
}
