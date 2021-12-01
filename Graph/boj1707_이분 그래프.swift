/*
 이분 그래프 개념 참고 : https://sanghoon9939.tistory.com/33
 */
import Foundation

var t = Int(readLine()!)!

while t>0{
    t -= 1
    
    let input = readLine()!.split(separator: " ").map{String($0)}
    
    let v = Int(input[0])!
    let e = Int(input[1])!
    
    var arrList: [[Int]] = Array(repeating: Array(), count: v+1)
    
    for _ in 0..<e{
        let nodes = readLine()!.split(separator: " ").map{String($0)}
        
        let first =  Int(nodes[0])!
        let second =  Int(nodes[1])!
        
        arrList[first].append(second)
        arrList[second].append(first)
    }
    
    var visited = Array(repeating: 0, count: v+1)
    var colors = Array(repeating: -1, count: v+1)
    
    func dfs(_ node: Int, _ color: Int){
        
        for adjNode in arrList[node]{
            if visited[adjNode] == 0{
                visited[adjNode] = 1
                if color == 0{
                    colors[adjNode] = 1
                    dfs(adjNode, 1)
                }
                else {
                    colors[adjNode] = 0
                    dfs(adjNode, 0)
                }
            }
        }
    }
    
    for i in 1...v{
        if visited[i] == 0{
            visited[i] = 1
            colors[i] = 0
            dfs(i,0)
        }
    }
    
    var flag = 0
    for i in 1...v{
        var color = colors[i]
        for j in 0..<arrList[i].count{
            if color == colors[arrList[i][j]] {
                flag = 1
                break
            }
        }
        if flag == 1{
            break
        }
    }
    if flag == 0{
        print("YES")
    }
    else {
        print("NO")
    }
}


