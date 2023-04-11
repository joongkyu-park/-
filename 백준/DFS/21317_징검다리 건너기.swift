let n = Int(readLine()!)!

var cost1 = Array(repeating: 0, count: n-1)
var cost2 = Array(repeating: 0, count: n-1)
for i in 0..<(n-1) {
    let cost = readLine()!.split(separator: " ").map { Int($0)! }
    cost1[i] = cost[0]
    cost2[i] = cost[1]
}
let k = Int(readLine()!)!
var minCost = Int.max

func dfs(_ index: Int, _ cost: Int, _ isUsedSuperJump: Bool) {
    if index == n - 1 {
        if cost < minCost {
            minCost = cost
        }
        return
    }
    if index + 1 < n {
        dfs(index + 1, cost + cost1[index], isUsedSuperJump)
    }
    
    if index + 2 < n {
        dfs(index + 2, cost + cost2[index], isUsedSuperJump)
    }
    
    if false == isUsedSuperJump {
        dfs(index + 3, cost + k, true)
    }
}

dfs(0, 0, false)

print(minCost)
