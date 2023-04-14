import Foundation

let ve = readLine()!.split(separator: " ").map { Int(String($0))! }
let (v, e) = (ve[0], ve[1])

var edgeList = [(Int, Int, Int)]()
var parent = Array(repeating: 0, count: v+1)
for i in 1...v {
    parent[i] = i
}
for _ in 0..<e {
    let abc = readLine()!.split(separator: " ").map { Int(String($0))! }
    let edge = (abc[0], abc[1], abc[2])
    edgeList.append(edge)
}
edgeList.sort { $0.2 < $1.2 }

func find(_ v: Int) -> Int{
    if v != parent[v] {
        parent[v] = find(parent[v])
    }
    return parent[v]
}

func union(_ a: Int, _ b: Int) {
    if a < b {
        parent[b] = a
    }
    else {
        parent[a] = b
    }
}

var sum = 0.0
for edge in edgeList {
    let (v, w, d) = (edge.0, edge.1, edge.2)
    let a = find(v)
    let b = find(w)
    if a == b { continue }
    union(a, b)
    sum += Double(d)
}

print(Int(sum))
