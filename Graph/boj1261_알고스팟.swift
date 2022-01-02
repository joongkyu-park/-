import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let m = input[1]
let n = input[0]
var map = Array(repeating: Array(repeating:0 , count: n), count: m)
for i in 0..<m{
    let line = Array(readLine()!).map{Int(String($0))!}
    for j in 0..<n{
        map[i][j] = line[j]
    }
}

var visited = Array(repeating: Array(repeating:0 , count: n), count: m)
var moveX = [0,0,1,-1]
var moveY = [1,-1,0,0]
var result = 0
var q = [(Int,Int,Int)]()
q.append((0,0,0))
visited[0][0] = 1
func bfs() {
    
    outer: while !q.isEmpty {
        let cur = q.removeFirst()
        let curX = cur.0
        let curY = cur.1
        var cnt = cur.2
        
        for i in 0..<4{
            let nextX = curX+moveX[i]
            let nextY = curY+moveY[i]
            cnt = cur.2
            
            if nextX == m-1 && nextY == n-1 {
                result = cnt
                break outer
            }
            if (0..<m).contains(nextX) && (0..<n).contains(nextY) && visited[nextX][nextY] == 0  {
                if map[nextX][nextY] == 1{
                    cnt += 1
                }
                visited[nextX][nextY] = 1
                
                q.append((nextX,nextY,cnt))
                q.sort{
                    return $0.2 < $1.2
                }
            }
        }
    }
}

bfs()
print(result)
