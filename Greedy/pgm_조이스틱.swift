import Foundation

/*
 진정한 의미의 greedy 문제..
 순방향으로 진행하다 인덱스마다 역방향으로 되돌아갔을 때를 모두 계산해서 그 중에 최소값을 고름..
 참조:https://velog.io/@sainkr/%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%A8%B8%EC%8A%A4-%EC%A1%B0%EC%9D%B4%EC%8A%A4%ED%8B%B1-Swift
 */
func solution(_ name:String) -> Int {
let aValue = 65
let zValue = 90
let name = name.map{ $0 }
func stickUpDown(c: Character) -> Int {
    let ascii = Int(c.asciiValue!)
    let front = ascii - aValue
    let back = zValue + 1 - ascii
    return min(front, back) }
// 위아래는 좌우의 이동과 상관이 없음 먼저 더해줌
var result = 0
for i in 0..<name.count { result += stickUpDown(c: name[i]) }
// 좌우로 움직이는경우는 한방향 또는 도중에 돌아가는경우이고 한방향으로갈시에는 문자열 수 - 1 과 같음
var count = name.count - 1
for i in 0..<name.count {
    if name[i] != "A" {
        var nextIndex = i + 1
        // 연속된 A가 많으면 되돌아 가는경우 검사
        while nextIndex < name.count && name[nextIndex] == "A" {
            nextIndex += 1 }
        // 지금까지 온거리 * 2 -> 왓다가 되돌아가는경우
        // 문자열수 - nextIndex -> 끝나는 마지막 인덱스까지의 거리
        let move = i * 2 + name.count - nextIndex
        count = min(move, count) } }
print(result+count)
return result+count
}



// 시도 했었던 흔적.. 
import Foundation

func solution(_ name:String) -> Int {
    var freq =  [Int]()
    
    func joystick(result: inout Int, name: String, cmpName: inout String, index: inout Int) {
        if name[name.index(name.startIndex, offsetBy: index)] ==
            cmpName[cmpName.index(cmpName.startIndex, offsetBy: index)]{
            result += 0
        }
        else{
            result += freq[index]
            let tmp = [name[name.index(name.startIndex, offsetBy: index)]]
            cmpName.replaceSubrange(cmpName.index(cmpName.startIndex, offsetBy: index) ..< cmpName.index(cmpName.startIndex, offsetBy: index+1), with: tmp)
        }
        var leftIndex: Int = index - 1
        var rightIndex: Int = index + 1
        while true{
            if name == cmpName {break}
            
            result += 1
            if leftIndex < 0 {
                leftIndex = name.count-1
            }
            if rightIndex >= name.count {
                rightIndex = 0
            }
            
            if name[name.index(name.startIndex, offsetBy: leftIndex)] !=
                cmpName[cmpName.index(cmpName.startIndex, offsetBy: leftIndex)] {
                index = leftIndex
                break
            }
            else if name[name.index(name.startIndex, offsetBy: rightIndex)] !=
                        cmpName[cmpName.index(cmpName.startIndex, offsetBy: rightIndex)] {
                index = rightIndex
                break
            }
            else {
                leftIndex -= 1
                rightIndex += 1
            }
        }
    }
    
    var cmpName: String = ""
    for _ in 0 ..< name.count {
        cmpName += "A"
    }
    
    for char in name {
        let charA: Character = "A"
        var def: Int = Int(char.asciiValue!) - Int(charA.asciiValue!)
        if def > 13 {
            def = 26 - (Int(char.asciiValue!) - Int(charA.asciiValue!))
        }
        freq.append(def)
    }
    
    var result: Int = 0
    var index: Int = 0
    while true {
        if name == cmpName {break}
        joystick(result: &result, name: name, cmpName: &cmpName, index: &index)
    }
    return result
}
