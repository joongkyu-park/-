import Foundation

func solution(_ citations:[Int]) -> Int {
    var c = citations
    c.sort()
    
    var h = c[c.count-1]
    
    while true {
        var citated = 0
        
        for i in (0..<c.count).reversed() {
            if c[i] >= h {citated += 1}
            else {break}
        }
        if citated >= h {break}
        else { h -= 1}
    }
    
    return h
}
