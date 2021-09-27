import Foundation

let n = Int(readLine()!)!

var d = [Int](repeating: 0, count: 31)

d[0] = 1
d[1] = 0
d[2] = 3
d[3] = 0
if n%2 == 0 {
    if n>=4 {
        for i in 4...n{
            var sum = 0
            for j in 2...i {
                if j % 2 != 0 {continue}
                else if j == 2 {sum += d[i-j]*3}
                else {
                    sum += d[i-j]*2
                }
            }
            d[i] = sum
        }
    }
    print(d[n])
}
else {
    print(0)
}
