import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    
    var priorities = priorities
    var sortedPriorities = [Int]()
    for p in priorities {
        sortedPriorities.append(p)
    }
    sortedPriorities.sort()
    sortedPriorities.reverse()
    
    var cnt = 0
    var idx = 0
    
    while true {
        if priorities[location] == -1 {
            break
        }
        if priorities[idx] == sortedPriorities[0] {
            cnt += 1
            priorities[idx] = -1
            sortedPriorities.remove(at: 0)
        }
        else {
            idx += 1
            if idx >= priorities.count {
                idx = 0
            }
        }
    }
    
    return cnt
}
