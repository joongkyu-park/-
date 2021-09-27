import Foundation

let n = Int(readLine()!)!

var parm = 10

var result = 0
while true {
    if n < parm {
        result += (n-parm/10+1) * String(n).count
        break
    }
    else {
        result += parm/10 * 9 * (String(parm/10).count)
        parm *= 10
    }
}

print(result)
