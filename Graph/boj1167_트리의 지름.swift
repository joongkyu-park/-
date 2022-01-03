let n = Int(readLine()!)!

var tree = Array(repeating: [(Int,Int)](), count: n+1)
var theLongestDistance = Array(repeating: [Int](), count: n+1)
var parent = Array(repeating: -1, count: n+1)

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    
    var idx = 1
    for _ in 0..<(input.count-2)/2{
        let v = input[0]
        let w = input[idx]
        let d = input[idx+1]
        
        tree[v].append((w, d))
        
        idx += 2
    }
}

func dfs(_ node: Int){
    for i in 0..<tree[node].count{
        var child = tree[node][i].0
        if parent[child] == -1 && child != 1{
            parent[child] = node
            dfs(child)
        }
    }
    return
}
dfs(1)

var max = -1
var cur = -1
var distanceFromCurToChild = -1
var curLongestDistance = -1

func findMax(_ node: Int, _ distance: Int){
    if tree[node].count == 1{
        if curLongestDistance < distanceFromCurToChild + distance{
            curLongestDistance = distanceFromCurToChild + distance
        }
        return
    }
    else{
        for i in 0..<tree[node].count {
            let c = tree[node][i].0
            let d = tree[node][i].1
            
            if parent[c] == node{
                findMax(c, distance+d)
            }
        }
    }
}

for i in 1...n {
    cur = i
    if cur == 1 || (tree[cur].count != 1){
        for j in 0..<tree[cur].count{
            var child = tree[cur][j].0
            if parent[child] == cur{
                distanceFromCurToChild = tree[cur][j].1
                findMax(child, 0)
                theLongestDistance[cur].append(curLongestDistance)
                curLongestDistance = -1
            }
        }
        theLongestDistance[cur].sort(by: >)
        if theLongestDistance[cur].count == 1 {
            if theLongestDistance[cur][0] > max {
                max = theLongestDistance[cur][0]
            }
        }
        else {
            if (theLongestDistance[cur][0] + theLongestDistance[cur][1]) > max {
                max = (theLongestDistance[cur][0] + theLongestDistance[cur][1])
            }
        }
    }
}
print(max)

