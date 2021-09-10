import Foundation

var t = Int(readLine()!)!
var dp = [UInt64](repeating: 0, count: 100001)
var assist = [[UInt64]](repeating: Array<UInt64>(repeating: 0, count: 3), count: 100001)

assist[1][0] = 1
assist[1][1] = 0
assist[1][2] = 0

assist[2][0] = 0
assist[2][1] = 1
assist[2][2] = 0

assist[3][0] = 1
assist[3][1] = 1
assist[3][2] = 1

assist[4][0] = 2
assist[4][1] = 0
assist[4][2] = 1


for i in 5...100000 {
    assist[i][0] = (assist[i-1][1] + assist[i-1][2]) % 1000000009
    assist[i][1] = (assist[i-2][0] + assist[i-2][2]) % 1000000009
    assist[i][2] = (assist[i-3][0] + assist[i-3][1]) % 1000000009
}

while t > 0 {
    t -= 1
    
    let n = Int(readLine()!)!

    print((assist[n][0] + assist[n][1] + assist[n][2]) % 1000000009)
}
