/*
수정 전 코드 : visited 체크를 꺼낼 때함
 -> 나중에 큐에 중복되는 원소들이 매우 많이 들어가기 때문에 시간초과!!!!!
 */
import Foundation


let s = Int(readLine()!)!

var time = 0
var visited = Array(repeating: Array(repeating: 0, count: 2001), count: 2001)
var q = [(Int,Int,Int)]()

q.append((1,0,0))

while !q.isEmpty{
    var cur = q.removeFirst()
    visited[cur.0][cur.1] = 1
    
    if cur.0 == s {
        time = cur.2
        break
    }
    
    if cur.0 > 0 && cur.0 < 2000 {
        if visited[cur.0][cur.0] == 0{
            q.append((cur.0,cur.0,cur.2+1))
        }
        if visited[cur.0-1][cur.1] == 0{
            q.append((cur.0-1,cur.1,cur.2+1))
        }
    }
    
    if cur.1 > 0 && cur.0 + cur.1 < 2000 {
        if visited[cur.0 + cur.1][cur.1] == 0{
            q.append((cur.0+cur.1,cur.1,cur.2+1))
        }
    }
}

print(time)


/*
 수정 후 코드 : visited 체크를 append할 때!!!
 */
import Foundation


let s = Int(readLine()!)!

var time = 0
var visited = Array(repeating: Array(repeating: 0, count: 2001), count: 2001)
var q = [(Int,Int,Int)]()

q.append((1,0,0))
visited[1][0] = 1
while !q.isEmpty{
    var cur = q.removeFirst()
    
    if cur.0 == s {
        time = cur.2
        break
    }
    
    if cur.0 > 0 && cur.0 < 2000 {
        if visited[cur.0][cur.0] == 0{
            visited[cur.0][cur.0] = 1
            q.append((cur.0,cur.0,cur.2+1))
        }
        if visited[cur.0-1][cur.1] == 0{
            visited[cur.0-1][cur.1] = 1
            q.append((cur.0-1,cur.1,cur.2+1))
        }
    }
    
    if cur.1 > 0 && cur.0 + cur.1 < 2000 {
        if visited[cur.0 + cur.1][cur.1] == 0{
            visited[cur.0 + cur.1][cur.1] = 1
            q.append((cur.0+cur.1,cur.1,cur.2+1))
        }
    }
}

print(time)
