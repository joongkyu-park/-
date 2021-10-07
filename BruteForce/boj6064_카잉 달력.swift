/*
 참고
 https://mygumi.tistory.com/325
 테케 참고  https://jm-park.github.io/algorithm/2018/08/02/%EB%B0%B1%EC%A4%80-6064%EB%B2%88-%EC%B9%B4%EC%9E%89-%EB%8B%AC%EB%A0%A5.html
 */
 import Foundation

let t = Int(readLine()!)!

for _ in 0..<t {
    let input = readLine()!.split(separator: " ").map{Int($0)}
    let M: Int = input[0]!
    let N: Int = input[1]!
    let x: Int = input[2]!
    let y: Int = input[3]!
    
    
    var sx = x
    var sy = x % N
    if sy == 0 {
        sy = N
    }
    
    
    let dx = sx
    let dy = sy
    
    var result = x
    
    if sx==x && sy==y {
        print(result)
    }
    else{
        while true{
            result += M
            sy += M
            sy %= N
            if sy == 0 {
                sy = N
            }
            
            if sx==x && sy==y {
                print(result)
                break
            }
            if sx==dx && sy==dy {
                print(-1)
                break
            }

        }
    }
}
