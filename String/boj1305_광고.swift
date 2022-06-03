// https://velog.io/@rootachieve/%EB%B0%B1%EC%A4%80-1305-%EA%B4%91%EA%B3%A0
// KMP의 핵심은 접두사와 접미사.

import Foundation

let l = Int(readLine()!)!
let p = Array(readLine()!).map{String($0)}

var pi = Array(repeating: 0, count: p.count)

func getPi(){
    var j = 0
    for i in 1..<p.count {
        
        while (j > 0) && (p[i] != p[j]) {
            j = pi[j-1]
        }
        if p[i] == p[j] {
            j += 1
            pi[i] = j
        }
    }
}

getPi()

print(p.count - pi[pi.count-1])
