import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    var sortedA = a.sorted()
    var sortedB = b.sorted()
    
    var aIndex = 0
    var bIndex = 0
    
    var answer = 0
    
    while bIndex < b.count {
        if sortedB[bIndex] > sortedA[aIndex]{
            answer += 1
            bIndex += 1
            aIndex += 1
        }
        else{
            bIndex += 1
        }
    }
    return answer
}
