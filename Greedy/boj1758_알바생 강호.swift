import Foundation

let n = Int(readLine()!)!
var customers = Array(repeating: -1, count: n)

for i in 0..<n {
    customers[i] = Int(readLine()!)!
}

customers.sort() { $0 > $1 }

var answer = 0
for i in 0..<n {
    let tip = customers[i] - ((i+1)-1)
    if tip < 0 { break }
    answer += tip
}

print(answer)
