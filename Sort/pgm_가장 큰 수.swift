import Foundation

/*
 sort 사용방법과 closure에서 $사용
 map, filter, reduce 함수들
 */
func solution(_ numbers:[Int]) -> String {
    var strings = numbers.map{String($0)}
    strings.sort{ $0+$1 > $1+$0 }
    
    let answer = strings.joined()
    // [0,0,0] 일 경우 0으로 만들어 주기 위해
    if let num = Int(answer) { return String(num) }
    return answer
}
