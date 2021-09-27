import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!

if m == 0 {
    print(String(n).count)
}
else{
    let broken = readLine()!.split(separator: " ").map{Character(String($0))}
    if m == 10 {
        print(abs(n-100))
    }
    else {
        var result1 = abs(n-100)
        var result2 = 1000001
        var flag = 0
        for i in 0...1000001 {
            flag = 0
            for j in Array(String(i)){
                if broken.contains(j) {
                    flag = 1
                    break
                }
            }
            if flag == 0 {
                result2 = min(result2, String(i).count + abs(i-n))
            }
        }
        print(min(result1,result2))
    }
}
