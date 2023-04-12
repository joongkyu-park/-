import Foundation

/*
 n이 최대 3백만이라 입력을 3백만개 받아야한다 -> Swift는 시간 초과
 -> 라이노님의 버퍼를 이용한 빠른 readLine 사용
 https://gist.github.com/JCSooHwanCho/30be4b669321e7a135b84a1e9b075f88
 
 */


// 빠른 입력 FileIO 클래스
class  FileIO {
    private var buffer:[UInt8]
    private var index: Int

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }

    @inline(__always)  private func read() -> UInt8 {
        defer { index += 1 }

        return buffer.withUnsafeBufferPointer { $0[index] }
    }

    @inline(__always)  func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10 || now == 32 { // 공백과 줄바꿈 무시
            now = read()
        }
        
        if now == 45{ // 음수 처리
            isPositive.toggle()
            now = read()
        }
        
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always)  func readString() -> String {
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

let file = FileIO()
let input = [file.readInt(), file.readInt(), file.readInt(), file.readInt()]
let n = input[0], d = input[1], k = input[2], c = input[3]

var sushi = [Int]()

for _ in 0..<n {
    sushi.append(file.readInt())
}

var answer = 0
var check = Array(repeating: 0, count: d + 1)
check[c] += 1
var count = 1

var index = 0
for _ in 0..<k {
    if index >= n {
        index = 0
    }
    let cur = sushi[index]
    if check[cur] == 0 {
        count += 1
    }
    check[cur] += 1
    index += 1
}
answer = count

for i in 1..<n {
    let old = i - 1
    check[sushi[old]] -= 1
    if check[sushi[old]] == 0 {
        count -= 1
    }
    var new = i + k - 1
    if new >= n {
        new -= n
    }
    check[sushi[new]] += 1
    if check[sushi[new]] == 1 {
        count += 1
    }
    answer = max(count, answer)
}

print(answer)
