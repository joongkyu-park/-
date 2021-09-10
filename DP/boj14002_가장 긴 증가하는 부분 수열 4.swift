import Foundation

var n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int($0)!}
var dp = [Int](repeating: 1, count: n)
var result = [[Int]](repeating: Array(repeating: 0, count: 0), count: n)
result[0].append(arr[0])

for i in 1..<n {
    for j in 0..<i {
        if arr[i] > arr[j] {
            if dp[i] > dp[j]+1 {
                continue
            }
            else {
                dp[i] = dp[j]+1
                result[i].removeAll()
                result[i] = result[j]
                result[i].append(arr[i])
            }
        }
    }
    if result[i].count == 0 {
        result[i].append(arr[i])
    }
}

var max = -1
var index = -1
for i in 0..<n{
    if max < dp[i] {
        max = dp[i]
        index = i
    }
}
print(max)
for r in result[index]{
    print(r, terminator: " ")
}


