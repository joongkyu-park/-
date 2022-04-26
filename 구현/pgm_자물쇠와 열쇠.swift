import Foundation

func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
    let m = key[0].count
    let n = lock[0].count
    
    var key = key
    var lock = lock
    var curlock = lock
    var flag = false
    
    func check() -> Bool{
        for i in 0..<n{
            for j in 0..<n{
                if curlock[i][j] == 0 || curlock[i][j] > 1{
                    return false
                }
            }
        }
        return true
    }
    
    outer: for count in 0..<4 {
        for r in (0..<n+(m-1)) {
            for c in (0..<n+(m-1)) {

                for row in 0...r {                    
                    for col in 0...c {
                        let keyRow = m-1-(r-row)
                        let keyCol = m-1-(c-col)
                        
                        if (0..<m).contains(keyRow) && (0..<m).contains(keyCol)
                        && (0..<n).contains(row) && (0..<n).contains(col){
                            curlock[row][col] += key[keyRow][keyCol]
                        }
                    }
                }
                flag = check()
                
                if flag {
                    break outer
                }
                curlock = lock
            }
        }
        
        var newKey = [[Int]]()
        var newRow = [Int]()
        for i in 0..<m {
            for j in (0..<m).reversed() {
                newRow.append(key[j][i])
            }
            newKey.append(newRow)
            newRow = [Int]()
        }
        key = newKey
        
    }
    return flag
}
