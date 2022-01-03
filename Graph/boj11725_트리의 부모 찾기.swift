let n = Int(readLine()!)!

var ll = Array(repeating: [Int](), count: n+1)
var parent = Array(repeating: -1, count: n+1)
for _ in 0..<n-1 {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    
    ll[input[0]].append(input[1])
    ll[input[1]].append(input[0])
}

func dfs(_ node: Int){
    if !ll[node].isEmpty{
        for i in 0..<ll[node].count{
            let cur = ll[node][i]
            if parent[node] != cur{
                parent[cur] = node
                dfs(cur)
            }
        }
    }
    return
}

dfs(1)

for i in 2...n {
    print(parent[i])
}
