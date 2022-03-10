// https://kyu9341.github.io/algorithm/2020/03/18/algorithm1201/
// https://hongjw1938.tistory.com/191

import Foundation

let nmk = readLine()!.split(separator: " ").map{Int(String($0))!}
var n = nmk[0]
var m = nmk[1]
let k = nmk[2]

if n >= m+k-1 && n <= m*k {
    var arr = [Int]()
    for i in 1...n { arr.append(i)}
    
    var answer = [Int]()
    var lastIdx = -1
    for i in (0..<k).reversed() {
        answer.append(arr[i])
    }
    lastIdx = answer.count
    n -= k
    m -= 1
    
    let q = m == 0 ? 1 : n / m
    var r = m == 0 ? 0 : n % m
    
    for _ in 0..<m {
        let add = r > 0 ? 1 : 0
        for idx in (lastIdx..<lastIdx + q + add).reversed() {
            answer.append(arr[idx])
        }
        if r>0 {r -= 1}
        lastIdx = answer.count
    }
    
    for i in 0..<answer.count {
        print(answer[i],terminator: " ")
    }
    print()
}
else {print(-1)}
