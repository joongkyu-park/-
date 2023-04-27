import Foundation

let nm = readLine()!.split(separator: " ").map{ Int(String($0))! }
let n = nm[0]
let m = nm[1]
var matrix = [[Int]]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    matrix.append(input)
}

var dpForUp = Array(repeating: Array(repeating: 0, count: m), count: n)
var dpForDown = Array(repeating: Array(repeating: 0, count: m), count: n)
var checkForUp = Array(repeating: Array(repeating: false, count: m), count: n)
var checkForDown = Array(repeating: Array(repeating: false, count: m), count: n)

var s = (n-1, 0)
var d = (n-1, m-1)
let upDirection = [(-1, 0), (0, 1)]
let downDirection = [(-1, 0), (0, -1)]

dpForUp[s.0][s.1] = matrix[s.0][s.1]
checkForUp[s.0][s.1] = true
for r in (0..<n).reversed() {
    for c in (0..<m) {
        for d in upDirection {
            let nextR = r + d.0
            let nextC = c + d.1
            guard (0..<n).contains(nextR) && (0..<m).contains(nextC) else { continue }
            if checkForUp[nextR][nextC] {
                dpForUp[nextR][nextC] = (dpForUp[nextR][nextC] > (dpForUp[r][c] + matrix[nextR][nextC])) ? dpForUp[nextR][nextC] : (dpForUp[r][c] + matrix[nextR][nextC])
            }
            else {
                dpForUp[nextR][nextC] = (dpForUp[r][c] + matrix[nextR][nextC])
                checkForUp[nextR][nextC] = true
            }
        }
    }
}

dpForDown[d.0][d.1] = matrix[d.0][d.1]
checkForDown[d.0][d.1] = true
for r in (0..<n).reversed() {
    for c in (0..<m).reversed() {
        for d in downDirection {
            let nextR = r + d.0
            let nextC = c + d.1
            guard (0..<n).contains(nextR) && (0..<m).contains(nextC) else { continue }
            if checkForDown[nextR][nextC] {
                dpForDown[nextR][nextC] = (dpForDown[nextR][nextC] > (dpForDown[r][c] + matrix[nextR][nextC])) ? dpForDown[nextR][nextC] : (dpForDown[r][c] + matrix[nextR][nextC])
            }
            else {
                dpForDown[nextR][nextC] = (dpForDown[r][c] + matrix[nextR][nextC])
                checkForDown[nextR][nextC] = true
            }
        }
    }
}

var result = Int.min
for r in 0..<n {
    for c in 0..<m {
        result = (result > (dpForUp[r][c] + dpForDown[r][c])) ? result : (dpForUp[r][c] + dpForDown[r][c])
    }
}

print(result)

