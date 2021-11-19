// 최단거리 문제 -> 다익스트라
import Foundation

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    var mtrx: [[Int]] = Array(repeating: Array(repeating: -1, count: N+1), count: N+1)
    var distanceFromStart: [Int] = Array(repeating: Int.max, count: N+1)
    
    for i in 0..<road.count{
        let n1 = road[i][0]
        let n2 = road[i][1]
        let d = road[i][2]
        
        if mtrx[n1][n2] == -1 {
            mtrx[n1][n2] = d
            mtrx[n2][n1] = d
        }
        else {
            if mtrx[n1][n2] > d {
                mtrx[n1][n2] = d
                mtrx[n2][n1] = d
            }
        }
    }
    
    func dijk(_ start: Int){
        distanceFromStart[1] = 0
        
        var q = [Int]()
        q.append(1)
        
        var index = 0
        var cur = start
        
        while !q.isEmpty {
            q.remove(at: index)
            
            for next in 1...N {
                if mtrx[cur][next] != -1 &&
                    mtrx[cur][next] + distanceFromStart[cur] < distanceFromStart[next] {
                    distanceFromStart[next] = mtrx[cur][next] + distanceFromStart[cur]
                    q.append(next)
                }
            }
            var min = Int.max
            var node = -1
            
            for i in 0..<q.count{
                if min > distanceFromStart[q[i]]{
                    min = distanceFromStart[q[i]]
                    cur = q[i]
                    index = i
                }
            }
        }
    }
    
    
    dijk(1)
    
    var answer = 0
    for i in 1...N {
        if distanceFromStart[i] <= k {
            answer += 1
        }
    }
    return answer
    
}
