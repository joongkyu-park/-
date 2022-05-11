import Foundation

func solution(_ gems:[String]) -> [Int] {
    var set = Set<String>()
    for gem in gems {
        set.insert(gem)
    }
    var dic = [String: Int]()

    for (index, element) in set.enumerated() {
        dic[element] = index
    }
    var gemCount = Array(repeating: 0, count: set.count)

    let n = set.count
    var answer = [[Int]]()

    set.removeAll()

    var s = 0
    for (e, gem) in gems.enumerated() {
        let gemIndex = dic[gem]!
        set.insert(gem)
        gemCount[gemIndex] += 1
        if set.count == n {
            while s <= e {
                let removeGem = gems[s]
                let removeGemIndex = dic[gems[s]]!
                gemCount[removeGemIndex] -= 1

                if gemCount[removeGemIndex] == 0 {
                    set.remove(removeGem)
                    answer.append([s,e, e-s])
                    s += 1
                    break
                }
                s += 1
            }
        }
    }

    answer.sort { $0[0] < $1[0] }
    answer.sort { $0[2] < $1[2] }

    let result = [answer[0][0]+1, answer[0][1]+1]

    return result
}

print(solution(["a", "b", "b", "b", "c", "b", "a"]))
