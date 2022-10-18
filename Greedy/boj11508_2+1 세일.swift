import Foundation

let n = Int(readLine()!)!
var dairyProducts = Array(repeating: -1, count: n)

for i in 0..<n {
    dairyProducts[i] = Int(readLine()!)!
}

dairyProducts.sort()

var index = n-1
var cost = 0

while index >= 0 {
    if (0..<n).contains(index-2) {
        cost += dairyProducts[index]
        cost += dairyProducts[index-1]
        index -= 3
        continue
    }
    else {
        while index >= 0 {
            cost += dairyProducts[index]
            index -= 1
        }
    }
}

print(cost)
