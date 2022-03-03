import Foundation

let nmk = readLine()!.split(separator: " ").map{Int(String($0))!}
var n = nmk[0]
var m = nmk[1]
var k = nmk[2]

var answer = n/2
if m >= n/2{
    n -= answer*2
    m -= answer
}
else {
    answer = m
    n -= answer*2
    m = 0
}

while k>0 {
    if m>0{
        m -= 1
        k -= 1
    }
    else if n>0{
        n -= 1
        k -= 1
    }
    else {
        answer -= 1
        n += 1
        m += 1
        k -= 1
    }
}

print(answer)
