let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]

var bridges = Array(repeating: [(Int, Int)](), count: n+1)
var maxWeight = 0
for _ in 0..<m {
    let abc = readLine()!.split(separator: " ").map { Int(String($0))! }
    let a = abc[0]
    let b = abc[1]
    let c = abc[2]
    bridges[a].append((b, c))
    bridges[b].append((a, c))
    if maxWeight < c {
        maxWeight = c
    }
}

let factories = readLine()!.split(separator: " ").map { Int(String($0))! }
let f1 = factories[0]
let f2 = factories[1]

var l = 1
var r = maxWeight
var answer = 0
while l <= r {
    var mid = (l + r) / 2
    var check = Array(repeating: false, count: n+1)
    var isPossible = false
    var queue = [Int]()
    queue.append(f1)
    check[f1] = true
    while !queue.isEmpty {
        let node = queue.removeFirst()
        if node == f2 {
            answer = mid
            l = mid + 1
            isPossible = true
            break
        }
        for bridge in bridges[node] {
            let fringe = bridge.0
            let curWeight = bridge.1
            if check[fringe] == false && curWeight >= mid {
                check[fringe] = true
                queue.append(fringe)
            }
        }
    }
    if false == isPossible {
        r = mid - 1
    }
}
print(answer)
