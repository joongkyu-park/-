import Foundation

let n = Int(readLine()!)!
let input = Array(readLine()!).split(separator: " ").map{Int(String($0))!}
var operators = Array(readLine()!).split(separator: " ").map{Int(String($0))!}
var maxResult = -1000000001
var minResult = 1000000001

var operatorsForCal = Array(repeating: 0, count: n-1)

func dfs(_ cnt: Int) {
    if cnt == n-1 {
        var result = input[0]
        for i in 0..<operatorsForCal.count{
            if operatorsForCal[i] == 0 {
                result += input[i+1]
            }
            else if operatorsForCal[i] == 1 {
                result -= input[i+1]
            }
            else if operatorsForCal[i] == 2 {
                result *= input[i+1]
            }
            else if operatorsForCal[i] == 3 {
                result /= input[i+1]
            }
        }
        if result > maxResult {
            maxResult = result
        }
        if result < minResult {
            minResult = result
        }
        return
    }
    for i in 0..<4 {
        if operators[i] > 0 {
            operatorsForCal[cnt] = i
            operators[i] -= 1
            dfs(cnt+1)
            operators[i] += 1
        }
    }
}

for i in 0..<4 {
    if operators[i] > 0 {
        operatorsForCal[0] = i
        operators[i] -= 1
        dfs(1)
        operators[i] += 1
    }
}
print(maxResult)
print(minResult)
