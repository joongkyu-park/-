import Foundation

func solution(_ info:[Int], _ edges:[[Int]]) -> Int {
    
    let n = info.count
    var linkedList = Array(repeating: [Int](), count: n)
    
    for edge in edges {
        let v = edge[0]
        let w = edge[1]
        linkedList[v].append(w)
    }
    var answer = 0
    
    func dfs(_ node: Int, _ childrenNodes: [Int], _ sheeps: Int, _ wolves: Int) {
        var childrenNodes = childrenNodes
        for (i, child) in childrenNodes.enumerated() {
            if node == child {
                childrenNodes.remove(at: i)
                break
            }
        }
        let sheeps = info[node] == 0 ? sheeps + 1 : sheeps
        let wolves = info[node] == 1 ? wolves + 1 : wolves
        if wolves >= sheeps { return }
        if sheeps > answer { answer = sheeps}
        linkedList[node].forEach {
            childrenNodes.append($0)
        }
        for child in childrenNodes {
            dfs(child, childrenNodes, sheeps, wolves)
        }
    }
    dfs(0, [0], 0, 0)
    return answer
}
