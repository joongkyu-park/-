import Foundation

let n = Int(readLine()!)!
var ropes = Array(repeating: -1, count: n)

for i in 0..<n {
    ropes[i] = Int(readLine()!)!
}

ropes.sort()

var answer = 0

for i in 0..<n {
    if answer < (ropes[i] * (n-i)) {
        answer = (ropes[i] * (n-i))
    }
}

print(answer)
