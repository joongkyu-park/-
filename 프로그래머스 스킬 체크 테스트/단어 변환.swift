import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var allWords = words
    allWords.insert(begin, at: 0)
    var linkedLikst = Array(repeating: [Int](), count: allWords.count)
    for (i, word) in allWords.enumerated() {
        for (j, comparedWord) in allWords.enumerated() {
            if i==j { continue }
            var defSum = 0
            let wordArr = Array(word)
            let comparedWordArr = Array(comparedWord)
            for k in 0..<wordArr.count {
                if wordArr[k] != comparedWordArr[k] {
                    defSum += 1
                }
            }
            if defSum == 1 {
                linkedLikst[i].append(j)
            }
        }
    }
    var visited = Array(repeating: false, count: allWords.count)
    var queue = [Int]()
    visited[0] = true
    queue.append(0)
    var level = 0
    var flag = false
    outer: while !queue.isEmpty {
        let count = queue.count
        for _ in 0..<count {
            let index = queue.removeFirst()
            if allWords[index] == target {
                flag = true
                break outer
            }
            for incidentIndex in linkedLikst[index] {
                if visited[incidentIndex] == false {
                    visited[incidentIndex] = true
                    queue.append(incidentIndex)
                }
            }
        }
        level += 1
    }
    
    if flag {
        return level
    }
    else {
        return 0
    }
}
