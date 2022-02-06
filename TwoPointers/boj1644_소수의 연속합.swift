import Foundation

let n = Int(readLine()!)!

var primeCheck = Array(repeating: true, count: n+1)

if n == 1{
    print(0)
}
else{
    for i in 2...n {
        if primeCheck[i] == false {continue}
        var j = i * 2
        while j <= n {
            primeCheck[j] = false
            j += i
        }
    }
    
    var end = 2
    var sum = 0
    var result = 0
    
    for start in 2...n {
        if primeCheck[start] {
            while end<=n && sum < n {
                if primeCheck[end] {
                    sum += end
                }
                end += 1
            }
            if sum == n { result += 1}
            
            sum -= start
        }
    }
    
    print(result)
}
