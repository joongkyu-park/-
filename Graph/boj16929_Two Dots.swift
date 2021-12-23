/*
 참고 : https://www.acmicpc.net/source/35267101
 
 - dfs를 빠져나왔을 때 visited를 false로 만들어주기
 - cycle 변수를 만들어서 싸이클이 생겼을 경우(시작위치 = 현재위치) cycle = true로 해주기
 - outer의 사용(구문 레이블)
 */
import Foundation
//16929번 Two Dots

let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N,M) = (t[0],t[1])
var graph = [[Character]]()

for _ in 0..<N {
    graph.append(Array(readLine()!))
}

let dx = [1,-1,0,0]
let dy = [0,0,1,-1]

var (sx,sy) = (0,0)
var visited = Array(repeating: Array(repeating: false, count: M), count:N)
var cycle = false

func dfs(_ x: Int, _ y: Int, _ cnt: Int){
    for i in 0..<4 {
        let (nx,ny) = (x+dx[i],y+dy[i])
        if (0..<N).contains(nx) && (0..<M).contains(ny) {
            if cnt >= 4 && sx == nx && sy == ny {
                cycle = true
                return
            }
            if !visited[nx][ny] && graph[nx][ny] == graph[x][y] {
                visited[nx][ny] = true
                dfs(nx,ny,cnt+1)
                visited[nx][ny] = false
            }
        }
    }
    return
}



outer: for i in 0..<N {
    for j in 0..<M {
        if !visited[i][j] {
            cycle = false
            (sx,sy) = (i,j)
            visited[i][j] = true
            dfs(i,j,1)

            if cycle {
                break outer
            }
        }
    }
}

print(cycle ? "Yes" : "No")
