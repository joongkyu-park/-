//아이디어 : https://gre-eny.tistory.com/281
import Foundation

let nk = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nk[0]
let k = nk[1]

var a = -1
var b = -1
var flag = true

for i in 1...n-1 {
    a = i
    b = n-i
    
    if a*b >= k{
        var arr = [String]()
        for _ in 0..<(a-1) {
            arr.append("A")
        }
        for _ in 0..<b {
            arr.append("B")
        }
        let remain = k - ((a-1)*b)
        arr.insert("A", at: arr.count-remain)
        
        for i in 0..<arr.count{
            print(arr[i], terminator: "")
        }
        print()
        flag = false
        break
    }
}
if flag{print(-1)}
