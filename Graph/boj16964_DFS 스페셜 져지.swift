import Foundation

let n = Int(readLine()!)!

var edges = Array(repeating: [Int](), count: n+1)

for _ in 0..<n-1 {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    edges[input[0]].append(input[1])
    edges[input[1]].append(input[0])
}

var order = readLine()!.split(separator: " ").map{Int($0)!}
var parent = Array(repeating: 0, count: n+1)
var check = Array(repeating: 0, count: n+1)

var index = 0
var q = [Int]()

var result = 1

func dfs(_ node: Int) {
    index += 1
    
    var children = [Int]()
    for child in edges[node] {
        if check[child] == 0 {
            parent[child] = node
            children.append(child)
        }
    }
    
    for _ in 0..<children.count{
        if parent[order[index]] == node{
            check[order[index]] = 1
            dfs(order[index])
        }
        else {
            result = 0
            return
        }
    }
}
check[1] = 1
dfs(1)
print(result)
