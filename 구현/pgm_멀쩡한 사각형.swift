import Foundation

// 첫번째 풀이가 왜 안되는지 상기

/*
func solution(_ w:Int, _ h:Int) -> Int64{
    let w = Int64(w)
    let h = Int64(h)
    
    let b: Double = w > h ? Double(w) : Double(h)
    let s: Double = w > h ? Double(h) : Double(w)
    
    let slope: Double = b / s
    
    var answer: Int64 = w*h
    
    var pre: Double = 0.0
    var cur: Double = 0.0
    
    var trashPart: Double = 0.0
    
    for _ in 0..<Int(s) {
        pre = cur
        cur += slope
        trashPart += floor(cur) - floor(pre) + 1
        if cur == floor(cur) {
            trashPart -= 1
        }
    }
    answer -= Int64(trashPart)
    
    return answer
}
*/


func solution(_ w:Int, _ h:Int) -> Int64{
    var a = w
    var b = h
    while a % b != 0 {
        let x = a % b
        a = b
        b = x
    }
    return Int64(w*h-(w+h-b))
}
