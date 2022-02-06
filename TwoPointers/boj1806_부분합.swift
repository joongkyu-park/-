import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let n = input[0]
let s = input[1]
let nums = readLine()!.split(separator: " ").map{Int($0)!}

var end = 0
var sum = 0

var lens = [Int]()

for start in 0..<n {
    while end < n && sum < s {
        sum += nums[end]
        end += 1
    }
    if sum >= s {
        lens.append(end-start)
    }
    sum -= nums[start]
}

print(lens.min() ?? 0)
