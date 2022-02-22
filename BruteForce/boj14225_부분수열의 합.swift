import Foundation

let n = Int(readLine()!)!
let input = Array(readLine()!).split(separator: " ").map{Int(String($0))!}

var checekd = Array(repeating: false, count: 100000*20+1)

for i in 1..<(1<<n){
    var sum = 0
    
    for j in 0..<n{
        if (i & 1<<j)>0 {
            sum += input[j]
        }
    }
    checekd[sum] = true
}

for i in 1...100000*20{
    if !checekd[i] {
        print(i)
        break
    }
}
