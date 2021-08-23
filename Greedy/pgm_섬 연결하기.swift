import Foundation

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    var costMatrix = [[Int]](repeating: Array(repeating: -1,count: n ), count: n)
    var edgesList = [[Int]]()
    for cost in costs {
        costMatrix[cost[0]][cost[1]] = cost[2]
        costMatrix[cost[1]][cost[0]] = cost[2]
    }
    
    var result = 0
    var startNode = 0
    var connectedNode: Set<Int> = []
    connectedNode.insert(startNode)
    while connectedNode.count < n {
        for i in 0..<n {
            if i == startNode { continue }
            else {
                if costMatrix[startNode][i] != -1 && !connectedNode.contains(i){
                    let edge = [startNode, i, costMatrix[startNode][i]]
                    edgesList.append(edge)
                }
            }
        }
        edgesList.sort{$0[2] > $1[2]}
        
        while true {
            let minEdge = edgesList.popLast()!
            if !connectedNode.contains(minEdge[0]) {
                
                result += minEdge[2]
                connectedNode.insert(minEdge[0])
                startNode = minEdge[0]
                
                break
            }
            else if !connectedNode.contains(minEdge[1]){
                
                result += minEdge[2]
                connectedNode.insert(minEdge[1])
                startNode = minEdge[1]
                
                break
            }
            else {
                
            }
        }
        
    }
    
    return result
}
