let n = Int(readLine()!)!

var tree = Array(repeating: [(Int,Int)](), count: n+1)
var theLongestDistance = Array(repeating: [Int](), count: n+1)

for _ in 0..<n-1 {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    
    let p = input[0]
    let c = input[1]
    let d = input[2]
    
    tree[p].append((c,d))
}

if n == 1{
    print(0)
}
else{
    var max = -1
    var cur = -1
    var distanceFromCurToChild = -1
    var curLongestDistance = -1
    
    func findMax(_ node: Int, _ distance: Int){
        if tree[node].count == 0{
            if curLongestDistance < distanceFromCurToChild + distance{
                curLongestDistance = distanceFromCurToChild + distance
            }
            return
        }
        else{
            for i in 0..<tree[node].count {
                let c = tree[node][i].0
                let d = tree[node][i].1
                
                findMax(c, distance+d)
            }
        }
    }
    
    for i in 1...n {
        cur = i
        if tree[cur].count != 0{
            for j in 0..<tree[cur].count{
                distanceFromCurToChild = tree[cur][j].1
                var child = tree[cur][j].0
                findMax(child, 0)
                theLongestDistance[cur].append(curLongestDistance)
                curLongestDistance = -1
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
}
