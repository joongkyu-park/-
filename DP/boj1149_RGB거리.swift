import Foundation

var n = Int(readLine()!)!

var rgb = [[Int]](repeating: Array(repeating: -1, count: 3), count: n+1)

for i in 1...n {
    var input = readLine()!.split(separator: " ").map{Int($0)!}
    rgb[i][0] = input[0]
    rgb[i][1] = input[1]
    rgb[i][2] = input[2]
}

var dpForR = [Int](repeating: -1, count: n+1)
var dpForG = [Int](repeating: -1, count: n+1)
var dpForB = [Int](repeating: -1, count: n+1)

dpForR[1] = rgb[1][0]
dpForG[1] = rgb[1][1]
dpForB[1] = rgb[1][2]

if n>=2 {
    for i in 2...n {
        dpForR[i] = min(dpForG[i-1], dpForB[i-1]) + rgb[i][0]
        dpForG[i] = min(dpForR[i-1], dpForB[i-1]) + rgb[i][1]
        dpForB[i] = min(dpForR[i-1], dpForG[i-1]) + rgb[i][2]
    }
}

print(min(dpForR[n],dpForG[n],dpForB[n]))
