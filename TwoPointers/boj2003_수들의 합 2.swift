import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let n = input[0]
let m = input[1]
let nums = readLine()!.split(separator: " ").map{Int($0)!}

var end = 0
var sum = 0

var result = 0

for start in 0..<n {
    while end < n && sum < m {
        sum += nums[end]
        end += 1
    }
    if sum == m {
        result += 1
    }
    sum -= nums[start]
}

print(result)
