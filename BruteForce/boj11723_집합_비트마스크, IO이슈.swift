/*
 비트마스크 첫 문제.
 비트마스크 개념 참고 사이트
 https://dojang.io/mod/page/view.php?id=184
 https://hyerios.tistory.com/174
 
 문제풀이 참고
 https://wisdom-990629.tistory.com/entry/C-%EB%B0%B1%EC%A4%80-11723%EB%B2%88-%EC%A7%91%ED%95%A9
 
 ⭐️ 여러번 출력하는건 string으로 한 번에 출력하기!!!
 
 라이노님의 Fast IO, 그리고 백준의 Swift 시간초과에 대해서...
 (이 문제는 그냥 Fast IO로도 풀 수 없고 스트링을 byte로 변환까지 시켜주어야한다.)
 https://velog.io/@rarebook92/%EB%B0%B1%EC%A4%80%EC%9D%80-Swift-%EC%8B%9C%EA%B0%84%EC%B4%88%EA%B3%BC%EC%97%90-%EA%B4%80%EB%8C%80%ED%95%B4%EC%A4%98%EB%9D%BC-ver.2
 
 https://www.acmicpc.net/source/33436795
 */
import Foundation

// 라이노님의 FileIO
final class FileIO {
    private var buffer:[UInt8]
    private var index: Int
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        
        return buffer.withUnsafeBufferPointer { $0[index] }
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        
        while now != 10
                && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }
        
        return str
    }
}
let fIO = FileIO()

let N = fIO.readInt()
var flag = 0b0
var str = ""
// var index = 0

for _ in 0..<N {
    
    let cmd = fIO.readString()
    //let input = readLine()!.split(separator: " ")
    
    if cmd == "empty" || cmd == "all"{
        if cmd == "all" {
            flag = Int(pow(2,Double(21)))-1
        }
        else if cmd == "empty" {
            flag = 0
        }
    }
    else{
        let num = fIO.readInt()
        let mask = Int(pow(2,Double(num)))
        
        if cmd == "add" {
            flag |= mask
        }
        else if cmd == "remove" {
            flag &= ~mask
        }
        else if cmd == "check" {
            var result = flag & mask
            
            // index += 1
            // print("#\(index) : ",terminator: "")
            if result == 0{
                str += "0\n"
            }
            else{
                str += "1\n"
            }
        }
        else if cmd == "toggle" {
            flag ^= mask
        }
    }
}
print(str)
