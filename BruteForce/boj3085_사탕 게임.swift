import Foundation
let n = Int(readLine()!)!

var candy = [[Character]](repeating: Array(), count: n)

for i in 0..<n {
    let input = Array(readLine()!)
    candy[i] = input
}
var result = 0
func check(_ x: Int, _ y: Int, _ _x: Int, _ _y:Int, _ candy: [[Character]]) -> Int{
    var _candy = candy
    if _x<0 || _x>=n {return 0}
    if _y<0 || _y>=n {return 0}
    
    var tmp = _candy[x][y]
    _candy[x][y] = _candy[_x][_y]
    _candy[_x][_y] = tmp
    
    var maxCnt = 0

    for i in 0..<n {
        for j in 0..<n {
            var cnt = 0
            for k in j..<n{
                if _candy[i][j] == _candy[i][k]{cnt += 1}
                else {
                    maxCnt = max(maxCnt, cnt)
                    break
                }
                maxCnt = max(maxCnt, cnt)
            }
        }
    }
    for i in 0..<n {
        for j in 0..<n {
            var cnt = 0
            for k in j..<n{
                if _candy[j][i] == _candy[k][i]{cnt += 1}
                else {
                    maxCnt = max(maxCnt, cnt)
                    break
                }
                maxCnt = max(maxCnt, cnt)
            }
        }
    }

    return maxCnt
}

for i in 0..<n {
    for j in 0..<n {
        if j == 2 {
            
        }
        result = max(result, check(i, j, i+1, j, candy))
        result = max(result, check(i, j, i, j+1, candy))
        
        
    }
}

print(result)
