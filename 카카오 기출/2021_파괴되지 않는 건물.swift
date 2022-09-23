/*
 https://kimjingo.tistory.com/155
 */
import Foundation

func solution(_ board:[[Int]], _ skill:[[Int]]) -> Int {
    let n = board.count
    let m = board[0].count
    
    var culmulativeBoard = Array(repeating: Array(repeating: 0, count: m+1), count: n+1)
    

    for skill in skill {
        let type = skill[0]
        let r1 = skill[1]
        let c1 = skill[2]
        let r2 = skill[3]
        let c2 = skill[4]
        let degree = skill[5]
        
        if type == 1 {
            culmulativeBoard[r1][c1] -= degree
            culmulativeBoard[r2+1][c2+1] -= degree
            culmulativeBoard[r1][c2+1] += degree
            culmulativeBoard[r2+1][c1] += degree
        }
        else if type == 2{
            culmulativeBoard[r1][c1] += degree
            culmulativeBoard[r2+1][c2+1] += degree
            culmulativeBoard[r1][c2+1] -= degree
            culmulativeBoard[r2+1][c1] -= degree
        }
        
    }
    
    for r in 0...n {
        for c in 1...m {
            culmulativeBoard[r][c] += culmulativeBoard[r][c-1]
        }
    }
    
    for c in 0...m {
        for r in 1...n {
            culmulativeBoard[r][c] += culmulativeBoard[r-1][c]
        }
    }
    
    var answer = 0
    for r in 0..<n {
        for c in 0..<m {
            culmulativeBoard[r][c] += board[r][c]
            if culmulativeBoard[r][c] > 0 { answer += 1 }
        }
    }
    
    return answer
}
