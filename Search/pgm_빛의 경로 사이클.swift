import Foundation

func solution(_ grid:[String]) -> [Int] {
    
    var result = [Int]()
    let gridArray = grid.map {
        Array($0).map { String($0) }
    }
    var visited = Array(repeating: Array(repeating: [false,false,false,false], count: gridArray[0].count), count: gridArray.count)
    
    // d, r, u, l
    // 0, 1, 2, 3

    let dr = [1,0,-1,0]
    let dc = [0,1,0,-1]
    
    var firstRow = -1
    var firstCol = -1
    var firstDirec = -1
    
    func search(_ r: Int, _ c: Int, _ cnt: Int, _ direc: Int) {
        
        var curR = r
        var curC = c
        var curDirec = direc
        
        if r<0 { curR = gridArray.count-1 }
        if r>gridArray.count-1 { curR = 0 }
        
        if c<0 { curC = gridArray[0].count-1 }
        if c>gridArray[0].count-1 { curC = 0 }
        
        if gridArray[curR][curC] == "L" {
            curDirec = direc+1 > 3 ? 0 : direc+1
        }
        else if gridArray[curR][curC] == "R" {
            curDirec = direc-1 < 0 ? 3 : direc-1
        }
        
        if visited[curR][curC][curDirec] == true
            && (curR == firstRow) && (curC == firstCol) && (curDirec == firstDirec) {
            result.append(cnt)
            return
        }
        if visited[curR][curC][curDirec] == true {
            return
        }
        
        visited[curR][curC][curDirec] = true
        search(curR+dr[curDirec], curC+dc[curDirec], cnt+1, curDirec)
    
    }
    
    for r in 0..<gridArray.count{
        for c in 0..<gridArray[0].count {
            for i in 0..<4 {
                if visited[r][c][i] == false {
                    visited[r][c][i] = true
                    firstRow = r
                    firstCol = c
                    firstDirec = i
                    search(r + dr[i], c + dc[i], 1, i)
                }
            }
        }
    }
    
    result.sort()
    
    return result
}
