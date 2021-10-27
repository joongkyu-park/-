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
var mtrx = [[Int]](repeating: Array(repeating: 0, count: N), count: N)
for i in 0..<N{
    for j in 0..<N{
        mtrx[i][j] = fIO.readInt()
    }
}

let flag = Int(pow(2,Double(N))-1)
var t1 = 0
var t2 = 0
var arr1 = [Int]()
var arr2 = [Int]()
var result = -1

var start = Int(pow(2,Double(N/2))-1)
var end = Int(pow(2,Double(N))-1) - Int(pow(2,Double(N/2))-1)

for i in start...end {
    var sum = 0
    var isOk = true
    for j in 0..<N {
        if 1<<j & i > 0{
            sum += 1
        }
        if sum > N/2 {
            isOk = false
            break
        }
    }
    if sum != N/2 {
        isOk = false
    }
    if isOk {
        t1 = i
        t2 = flag^i
        arr1.removeAll()
        arr2.removeAll()
        for j in 0..<N {
            if 1<<j & t1 > 0{
                arr1.append(j)
            }
            else {
                arr2.append(j)
            }
        }
        var t1Sum = 0
        var t2Sum = 0
        
        for j in 0..<arr1.count {
            for k in 0..<arr1.count {
                t1Sum += mtrx[arr1[j]][arr1[k]]
                t2Sum += mtrx[arr2[j]][arr2[k]]
            }
        }
        
        if result < 0 || abs(t1Sum-t2Sum) < result{
            result = abs(t1Sum-t2Sum)
        }
        if result == 0{
            
        }
    }
}

print(result)

