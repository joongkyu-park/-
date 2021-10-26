/*
 부분집합 구하기 문제
 - Brute Force로 재귀함수 이용해서 풀기
 https://jaimemin.tistory.com/571
 - 비트마스크 이용해서 이진수를 부분집합으로 만들어서 풀기
 https://selina-park.tistory.com/103 (비트마스크로 부분집합 만들기 개념)
 https://dolphins-it.tistory.com/219 (실제 문제풀이)
 
 아래 풀이는 비트마스크를 사용
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
let S = fIO.readInt()

var arr = [Int]()
var result = 0

for _ in 0..<N{
    let input = fIO.readInt()
    arr.append(input)
}

for i in 1..<1<<N {
    
    var sum = 0
    for j in 0..<N {
        if i&(1<<j) != 0 {
            sum += arr[j]
        }
    }
    if sum == S {
        result += 1
    }
}

print(result)
