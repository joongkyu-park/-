/*
 FileIO없으면 시간초과..
 */
import Foundation

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

let n = fIO.readInt()
let m = fIO.readInt()

var arr1 = [Int]()
var arr2 = [Int]()

for _ in 0..<n {
    let input = fIO.readInt()
    arr1.append(input)
}

for _ in 0..<m {
    let input = fIO.readInt()
    arr2.append(input)
}
var answer = ""
var arr1Idx = 0
var arr2Idx = 0

while arr1Idx < n && arr2Idx < m {
    if arr1[arr1Idx] < arr2[arr2Idx] {
        answer += "\(arr1[arr1Idx]) "
        arr1Idx += 1
    }
    else {
        answer += "\(arr2[arr2Idx]) "
        arr2Idx += 1
    }
}

if arr1Idx < n {
    while arr1Idx < n{
        answer += "\(arr1[arr1Idx]) "
        arr1Idx += 1
    }
}
else {
    while arr2Idx < m{
        answer += "\(arr2[arr2Idx]) "
        arr2Idx += 1
    }
}


print(answer)
