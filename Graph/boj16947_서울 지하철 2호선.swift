import Foundation

let n = Int(readLine()!)!

var stations = Array(repeating: [Int](), count: n+1)

for _ in 0..<n {
    var input = readLine()!.split(separator: " ").map{Int($0)!}
    stations[input[0]].append(input[1])
    stations[input[1]].append(input[0])
}
var visited = Array(repeating: 0, count: n+1)
var cycleNodes = [Int]()
var cycle = 0
var start = -1


func dfs(_ node: Int, _ cnt: Int){

    for i in stations[node]{
        
        if i == start && cnt >= 3{
            cycle = 1
            cycleNodes = visited
            return
        }
        
        if visited[i] == 0{
            visited[i] = 1
            dfs(i, cnt+1)
            visited[i] = 0
        }
    }
}
for i in 1...n{
    visited[i] = 1
    start = i
    dfs(i, 1)
    visited[i] = 0
    
    if cycle == 1 {
        break
    }
}

var result = -1
func dfs2(_ node: Int, _ cnt: Int){
    
    if cycleNodes[node] == 1{
        if result > cnt || result == -1{
            result = cnt
            return
        }
    }
    
    for i in stations[node]{
        if visited[i] == 0{
            visited[i] = 1
            dfs2(i, cnt+1)
            visited[i] = 0
        }
    }
}

for i in 1...n {
    if i==6{
        
    }
    if cycleNodes[i] == 1{
        print(0, terminator: " ")
    }
    else {
        visited[i]=1
        dfs2(i, 0)
        visited[i]=0
        print(result, terminator: " ")
        result = -1
    }
}
