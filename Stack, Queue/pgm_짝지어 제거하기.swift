import Foundation
/*
 배열 remove 메소드의 시간복잡도는 O(n)이므로 아래의 코든느 O(n^2)이 된다.
 
 func solution(_ s:String) -> Int{
 var sArr = Array(s)
 
 var i = 0
 var lastIndex = s.count-1
 
 while i < lastIndex {
 if sArr[i] == sArr[i+1] {
 sArr.remove(at: i)
 sArr.remove(at: i)
 if i != 0 {i-=1}
 lastIndex = sArr.count-1
 }
 else { i += 1 }
 }
 
 if sArr.isEmpty {
 return 1
 } else { return 0 }
 
 
 }
 */

//https://velog.io/@rytak108/%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%A8%B8%EC%8A%A4-%EC%A7%9D%EC%A7%80%EC%96%B4-%EC%A0%9C%EA%B1%B0%ED%95%98%EA%B8%B0-Swift
func solution(_ s:String) -> Int{
    var str = Array(s)
    var result: [Character] = []
    let s_len = str.count
    
    for i in 0..<s_len {
        if !result.isEmpty && result.last == str[i] {
            result.removeLast()
        } else {
            result.append(str[i])
        }
    }
    return result.isEmpty ? 1 : 0
}
