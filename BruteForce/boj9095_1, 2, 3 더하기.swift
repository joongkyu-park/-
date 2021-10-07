import Foundation

let t = Int(readLine()!)!

for _ in 0..<t {
    let n = Int(readLine()!)!
    
    var d = [Int](repeating: 0, count: 12)
    d[1] = 1
    d[2] = 2
    d[3] = 4
    
    for i in 4...11 {
        d[i] = d[i-1] + d[i-2] + d[i-3]
    }
    print(d[n])
}
