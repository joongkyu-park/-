// 출처 : https://www.acmicpc.net/user/golddol2003
// parent배열의 활용이 시간초과를 줄이는데에 관건. (원래는 배열의 contains 함수를 이용해서 하나하나 찾으려다보니까 시간초과)

// 22.3.13 업데이트

import Foundation

let n = Int(readLine()!)!

var edges: [[Int]] = Array(repeating: [], count: n+1)
var parent = Array(repeating: -1, count: n+1)

for _ in 0..<n-1{
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    edges[input[0]].append(input[1])
    edges[input[1]].append(input[0])
}
let order = readLine()!.split(separator: " ").map{Int(String($0))!}


var q = [Int]()
var visited = Array(repeating: false, count: n+1)

if order[0] == 1 {
    q.append(1)
    parent[1] = -2 //root node
    visited[1] = true
    var orderIdx = 1
    
    var answer = 1
    
    outer: while !q.isEmpty {
        let node = q.removeFirst()
        var childCnt = 0
        for i in 0..<edges[node].count {
            let childNode = edges[node][i]
            if parent[childNode] == -1 {
                parent[childNode] = node
                childCnt += 1
            }
        }
        
        for i in orderIdx..<orderIdx + childCnt {
            let childNode = order[i]
            
            if visited[childNode] == false {
                if parent[childNode] != node {
                    answer = 0
                    break outer
                }
                q.append(childNode)
                visited[childNode] = true
            }
        }
        orderIdx += childCnt
    }
    
    print(answer)
}
else {print(0)}
