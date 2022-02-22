import Foundation

let n = Int(readLine()!)!
var alphabetSum = Array(repeating: 0, count: 26)
var indexUsed = [(Int,Int)]()
for _ in 0..<n{
    let input = Array(readLine()!).map{String($0)}
    
    var digit = input.count-1
    for i in 0..<input.count{
        let index = Int(UnicodeScalar(input[i])!.value) - 65
        alphabetSum[index] += Int(pow(10.0, Double(digit)))
        digit -= 1
    }
}

for i in 0..<alphabetSum.count{
    if alphabetSum[i] > 0{
        indexUsed.append((i,alphabetSum[i]))
    }
}
indexUsed.sort{ $0.1 > $1.1}

var sum = 0
for i in (0..<indexUsed.count) {
    sum += indexUsed[i].1 * (9-i)
}
print(sum)



// dfs로 백트래킹 brute force로 푼 방식
// 계산해보면 시간이 10^10 + 알파 라서 매우 느림.

/*
import Foundation

let n = Int(readLine()!)!
var inputs = [[String]]()

for _ in 0..<n{
    let input = Array(readLine()!).map{String($0)}
    inputs.append(input)
}

var isUsed = Array(repeating: false, count: 26)
var alphabetIndex = [Int]()
var alphabetToInt = Array(repeating: -1, count: 26)

var maxSum = 0

for i in 0..<n{
    let input = inputs[i]
    for j in 0..<input.count{
        let index = Int(UnicodeScalar(input[j])!.value) - 65
        isUsed[index] = true
    }
}

for i in 0..<isUsed.count{
    if isUsed[i]{
        alphabetIndex.append(i)
    }
}
alphabetIndex.sort()

var visited = Array(repeating: false, count: alphabetIndex.count)

func dfs(_ cnt: Int) {
    if cnt == alphabetIndex.count{
        var sum = 0
        for i in 0..<inputs.count{
            let input = inputs[i]
            var str = ""
            for j in 0..<input.count{
                let index = Int(UnicodeScalar(input[j])!.value) - 65
                let curNum = alphabetToInt[index]
                str += String(curNum)
            }
            sum += Int(str)!
        }
        if sum >= maxSum{
            maxSum = sum
        }
        return
    }
    
    for i in 0...9{
        if visited[i] == false{
            alphabetToInt[alphabetIndex[cnt]] = i
            visited[i] = true
            dfs(cnt+1)
            visited[i] = false
        }
    }
}

for i in 0...9{
    alphabetToInt[alphabetIndex[0]] = i
    visited[i] = true
    dfs(1)
    visited[i] = false
}

print(maxSum)
*/
