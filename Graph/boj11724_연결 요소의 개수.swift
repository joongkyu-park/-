import Foundation

let m: Int
let n: Int

let input = readLine()!.split(separator: " ").map{String($0)}
m = Int(input[0])!
n = Int(input[1])!

var arrList = Array(repeating: Array<Int>(), count: m+1)

for _ in 0..<n {
    let relationship = readLine()!.split(separator: " ").map{String($0)}
    let first = Int(relationship[0])!
    let second = Int(relationship[1])!
    
    arrList[first].append(second)
    arrList[second].append(first)
}

var visited = Array(repeating: 0, count: m+1)
var result = 0

func dfs(_ node: Int){
    for i in 0..<arrList[node].count {
        let next = arrList[node][i]
        if visited[next] == 0 {
            visited[next] = 1
            dfs(next)
        }
    }
}


for i in 1...m {
    if visited[i] == 0{
        visited[i] = 1
        dfs(i)
        result += 1
    }
}
    
print(result)
