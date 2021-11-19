import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    var sortedArr = d.sorted()
    var answer = 0
    var money = budget
    
    for i in 0..<sortedArr.count {
        if money - sortedArr[i] >= 0 {
            answer += 1
            money -= sortedArr[i]
        }
        else {
            break
        }
    }
    
    return answer
}
