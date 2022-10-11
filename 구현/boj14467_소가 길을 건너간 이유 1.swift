import Foundation

let n = Int(readLine()!)!
var cows = Array(repeating: -1, count: 11)
var answer = 0
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    if cows[input[0]] == -1 {
        cows[input[0]] = input[1]
    }
    else {
        if cows[input[0]] != input[1] {
            cows[input[0]] = input[1]
            answer += 1
        }
    }
}
print(answer)
