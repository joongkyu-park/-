import Foundation

let n = Int(readLine()!)!

var twoCoins = 0
var answer = -1

while twoCoins * 2 <= n {
    let remain = n - twoCoins*2
    if remain % 5 == 0 {
        answer = 0
        answer += remain / 5
        answer += twoCoins
        break
    }
    twoCoins += 1
}

print(answer)
