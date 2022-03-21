import Foundation

let t = Array(readLine()!)
let p = Array(readLine()!)

if t.count < p.count { print(0)}
else {
    var pi = Array(repeating: 0, count: p.count)
    
    func getPi() {
        var j = 0
        
        for i in 1..<p.count{
            while j>0 && p[j] != p[i] {
                j = pi[j-1]
            }
            
            if p[j] == p[i] {
                j += 1
                pi[i] = j
            }
        }
    }
    getPi()
    
    var cnt = 0
    var answer = [Int]()
    
    var j = 0
    var i = 0
    while i<t.count{
    //for i in 0..<t.count {
        while j>0 && p[j] != t[i] {
            j = pi[j-1]
        }
        
        if p[j] == t[i] {
            if j == p.count-1 {
                cnt += 1
                answer.append(i-p.count+2)
                j = pi[j]
                //i = i-p.count+2
            }
            else {
                j += 1
            }
        }
        i += 1
    }
    
    print(cnt)
    for i in 0..<answer.count{
        print(answer[i], terminator: " ")
    }
    print()
}
