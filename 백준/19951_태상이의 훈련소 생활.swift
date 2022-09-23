/*
 https://hsdevelopment.tistory.com/772
 */
import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let n = input[0]
let m = input[1]
let ground = readLine()!.split(separator: " ").map{ Int($0)! }

var cumulativeSum = Array(repeating: 0, count: ground.count)
for _ in 0..<m {
    let order = readLine()!.split(separator: " ").map{ Int($0)! }
    let start = order[0]-1
    let end = order[1]-1
    let value = order[2]
    cumulativeSum[start] += value
    if end+1 < n {
        cumulativeSum[end+1] -= value
    }
}
for i in 1..<n {
    cumulativeSum[i] += cumulativeSum[i-1]
}
for i in 0..<n {
    cumulativeSum[i] +=  ground[i]
}

cumulativeSum.forEach{
    print($0, terminator: " ")
}
