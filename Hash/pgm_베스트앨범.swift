import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var genres = genres
    var plays = plays
    var result = [Int]()
    
    var dic: Dictionary = [String:Int]()
    
    for i in 0..<genres.count {
        var flag = 0
        for d in dic {
            if d.key == genres[i]{
                var v = d.value
                dic.updateValue(plays[i] + v, forKey: d.key)
                flag = 1
            }
        }
        if flag == 0{
            dic[genres[i]] = plays[i]
        }
    }
    
    let sortedDic = dic.sorted { $0.1 > $1.1 }
    
    for i in 0..<sortedDic.count {
        var g = sortedDic[i].key
        
        var first = -1
        var firstIndex = -1
        var second = -1
        var secondIndex = -1
        for j in (0..<genres.count).reversed() {
            if genres[j] == g {
                if first <= plays[j] {
                    second = first
                    secondIndex = firstIndex
                    first = plays[j]
                    firstIndex = j
                }
                else if second <= plays[j] {
                    second = plays[j]
                    secondIndex = j
                }
            }
        }
        if second == -1 {
            result.append(firstIndex)
        }
        else {
            result.append(firstIndex)
            result.append(secondIndex)
        }
    }
    return result
}
