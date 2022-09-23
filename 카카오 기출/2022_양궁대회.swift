import Foundation

func solution(_ n:Int, _ info:[Int]) -> [Int] {
    
    var results = [([Int], Int)]()
    
    func dfs(_ index: Int, _ arrowsCount: Int, _ scores: [Int]) {
        if arrowsCount == 0 {
            check(scores)
            return
        }
        
        for dartIndex in index...10 {
            var scores = scores
            scores[dartIndex] += 1
            dfs(dartIndex, arrowsCount-1, scores)
        }
    }
    
    func check(_ scores: [Int]) {
        var appeach = 0
        var lion = 0
        for i in 0...10 {
            if info[i] == 0 && scores[i] == 0 {
                continue
            }
            if info[i] >= scores[i] {
                appeach += 10-i
            }
            else {
                lion += 10-i
            }
        }
        if lion > appeach {
            results.append((scores, lion-appeach))
        }
    }

    
    var emptyScores = Array(repeating: 0, count: 11)
    
    for dartIndex in 0...10 {
        emptyScores = Array(repeating: 0, count: 11)
        emptyScores[dartIndex] += 1
         dfs(dartIndex, n-1, emptyScores)
    }
    
    if results.isEmpty { return [-1] }
    
    results.sort{ $0.1 > $1.1 }
    let maxDef = results[0].1
    var index = 0
    while results[index].1 == maxDef  {
        index += 1
        if index >= results.count {
            break
        }
    }
    var answers = Array(results[0..<index]).map { $0.0 }
    
    for i in 0...10 {
        answers.sort{$0[i] > $1[i]}
    }
    return answers.first!
}
