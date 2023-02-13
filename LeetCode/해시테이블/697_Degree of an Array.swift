import Foundation

class Solution {
    func findShortestSubArray(_ nums: [Int]) -> Int {
        var countDict: [Int: Int] = [:]
        var indiceDict: [Int: [Int]] = [:]

        for (i, num) in nums.enumerated() {
            if countDict[num] == nil {
                countDict[num] = 1
                indiceDict[num] = [i]
                continue
            }
            guard let count = countDict[num] else { continue }
            guard var indice = indiceDict[num] else { continue }
            countDict[num] = count + 1
            indiceDict[num] = indice + [i]
        }
        
        let sortedCountArr = Array(countDict).sorted { $0.value > $1.value }
        var resultNumArr = [Int]()
        var maxCount = -1
        for element in sortedCountArr {
            if maxCount == -1 {
                maxCount = element.value
                resultNumArr.append(element.key)
                continue
            }
            if maxCount == element.value {
                resultNumArr.append(element.key)
                continue
            }
            break
        }
        
        var resultIndiceArr = [[Int]]()
        for num in resultNumArr {
            resultIndiceArr.append(indiceDict[num]!.sorted())
        }
        
        var result = -1
        for indice in resultIndiceArr {
            let length = indice.last! - indice.first! + 1
            if result == -1 {
                result  = length
                continue
            }
            if result > length {
                result = length
            }
        }
        return result
    }
}
