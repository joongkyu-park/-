import Foundation

let n = Int(readLine()!)!

var land = Array(repeating: Array(repeating: 0, count: n), count: n)

var moveX = [1,0,-1,0]
var moveY = [0,1,0,-1]

for i in 0..<n {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    for j in 0..<n {
        if input[j] != 0{
            land[i][j] = -1
        }
    }
}

var label = 1


func dfs_labeling(_ x: Int, _ y: Int){
    for i in 0..<4 {
        if (0..<n).contains(x+moveX[i])
            && (0..<n).contains(y+moveY[i])
            && land[x + moveX[i]][y + moveY[i]] == -1 {
            land[x+moveX[i]][y+moveY[i]] = label
            dfs_labeling(x+moveX[i],y+moveY[i])
        }
    }
}

for i in 0..<n{
    for j in 0..<n{
        if land[i][j] == -1 {
            land[i][j] = label
            dfs_labeling(i, j)
            label += 1
        }
    }
}

var minDistance = 201

func bfs(_ x: Int, _ y: Int){
    var visited = Array(repeating: Array(repeating: 0, count: n), count: n)
    visited[x][y] = 1
    
    var q = [(Int,Int)]()
    var d = 0
    let curLabel = land[x][y]
    
    q.append((x,y))
    
    outer: while !q.isEmpty{
        let size = q.count
        
        for _ in 0..<size{
            let curLand = q.removeFirst()
            let curX = curLand.0
            let curY = curLand.1
            
            for i in 0..<4
            {
                let nextX = curX + moveX[i]
                let nextY = curY + moveY[i]
                
                if ((0..<n).contains(nextX)) && ((0..<n).contains(nextY))
                {
                    if (land[nextX][nextY] == 0) && (visited[nextX][nextY] == 0)
                    {
                        visited[nextX][nextY] = 1
                        q.append((nextX,nextY))
                    }
                    else if (land[nextX][nextY] != curLabel) && (land[nextX][nextY] != 0)
                    {
                        if minDistance > d{
                            minDistance = d
                        }
                        break outer
                    }
                }
            }
        }
        d += 1
    }
}
for i in 0..<n
{
    for j in 0..<n
    {
        if land[i][j] != 0
        {
            bfs(i, j)
        }
    }
}

print(minDistance)
