import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var cnt = Array(repeating: 0, count: n)
    var index = 0
    var totalIndex = 0
    var dic = [String]()
    var result = [0, 0]
    
    while totalIndex != words.count {
        if totalIndex == 0{
            cnt[index] += 1
            
            dic.append(words[totalIndex])
            totalIndex += 1
            index += 1
            if index == n {
                index = 0
            }
        }
        else {
            let before = Array(words[totalIndex-1])
            let cur = Array(words[totalIndex])
            
            cnt[index] += 1
            if before[before.count-1] != cur[0]
                || cur.count <= 1
                || dic.contains(words[totalIndex]){
                result[0] = index+1
                result[1] = cnt[index]
                break
            }
            else {
                dic.append(words[totalIndex])
                totalIndex += 1
                index += 1
                if index == n {
                    index = 0
                }
            }
        }
    }
    return result
}
