import Foundation

let hw = readLine()!.split(separator: " ").map{ Int(String($0))! }
let h = hw[0]
let w = hw[1]
var blocks = readLine()!.split(separator: " ").map{ Int(String($0))! }
var matrix = Array(repeating: Array(repeating: 0, count: w), count: h)
for r in (0..<h).reversed() {
    for c in 0..<w {
        if blocks[c] > 0 {
            matrix[r][c] = 1
            blocks[c] -= 1
        }
    }
}

var result = 0
var count = 0
var flag = false

for r in 0..<h {
    count = 0
    flag = false
    for c in 0..<w {
        if flag {
            if matrix[r][c] == 0 {
                count += 1
            }
            else if matrix[r][c] == 1 {
                result += count
                count = 0
            }
        }
        else {
            if matrix[r][c] == 1 {
                flag = true
            }
        }
    }
}

print(result)
