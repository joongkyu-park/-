// 주요 사용 개념 : 조합, dictionary
import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    
    var dic = [[String]: Int]()
    
    func dfs(_ arr: [String], _ combination: [String], _ cnt: Int, _ courseNum: Int, _ nextIndex: Int) {
        if cnt == courseNum {
            let result = combination.sorted()
            if dic[result] == nil {
                dic[result] = 1
            }
            else {
                dic[result]! += 1
            }
            return
        }
        
        if nextIndex < arr.count {
            for i in nextIndex..<arr.count {
                var newCombination = combination
                newCombination.append(arr[i])
                dfs(arr, newCombination, cnt+1, courseNum, i+1)
            }
        }
        
        
    }
    
    for order in orders {
        let arr = Array(order).map{String($0)}
        for courseNum in course {
            for i in 0..<arr.count {
                dfs(arr, [arr[i]], 1, courseNum, i+1)
            }
        }
    }
    
    var answer = [String]()
    var answerArr = Array(repeating: [String](), count: 11)
    var courseMax = Array(repeating: 0, count: 11)
    
    
    for _ in 0..<dic.count {
        let candidate = dic.popFirst()!
        
        if candidate.value >= 2 {
            for courseNum in course {
                if candidate.key.count == courseNum {
                    if courseMax[courseNum] < candidate.value {
                        courseMax[courseNum] = candidate.value
                        answerArr[courseNum].removeAll()
                        var answerStr = ""
                        for j in 0..<candidate.key.count {
                            answerStr += candidate.key[j]
                        }
                        answerArr[courseNum].append(answerStr)
                    }
                    else if courseMax[courseNum] == candidate.value {
                        var answerStr = ""
                        for j in 0..<candidate.key.count {
                            answerStr += candidate.key[j]
                        }
                        answerArr[courseNum].append(answerStr)
                    }
                    
                    break
                }
            }
        }
    }
    
    for i in 2...10 {
        for j in 0..<answerArr[i].count {
            answer.append(answerArr[i][j])
        }
    }
    answer.sort()
   
    return answer
}
