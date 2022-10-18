//유니온파인드 코드
//parent값이 음수 -> 최상의 루트노드, 절대값이 집합크기
import Foundation

//복습

//let n = 10
//
//var parent = Array(repeating: -1, count: n)
//
//func find(_ x: Int) -> Int {
//    return x < 0 ? x : find(parent[x])
//}
//
//func union(_ a: Int, _ b: Int) {
//    let aRoot = find(a)
//    let bRoot = find(b)
//    if aRoot == bRoot { return }
//
//    if parent[aRoot] < parent[bRoot] {
//        parent[aRoot] += parent[bRoot]
//        parent[bRoot] = aRoot
//    }
//    else {
//        parent[bRoot] += parent[aRoot]
//        parent[aRoot] = bRoot
//    }
//}
