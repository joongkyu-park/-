import Foundation

func solution(_ str1: String, _ str2: String) -> Int {
    
    let arr1 = Array(str1).map{String($0)}
    let arr2 = Array(str2).map{String($0)}
    
    var multiSet1 = [String]()
    var multiSet2 = [String]()
    
    for i in 0..<arr1.count-1 {
        var value1 = Int(UnicodeScalar(arr1[i])!.value)
        var value2 = Int(UnicodeScalar(arr1[i+1])!.value)
        
        if ((65...90).contains(value1) || (97...122).contains(value1))
            && ((65...90).contains(value2) || (97...122).contains(value2)) {
            if (65...90).contains(value1) {
                value1 += 32
            }
            if (65...90).contains(value2) {
                value2 += 32
            }
            multiSet1.append(String(UnicodeScalar(value1)!) + String(UnicodeScalar(value2)!))
        }
    }
    for i in 0..<arr2.count-1 {
        var value1 = Int(UnicodeScalar(arr2[i])!.value)
        var value2 = Int(UnicodeScalar(arr2[i+1])!.value)
        
        if ((65...90).contains(value1) || (97...122).contains(value1))
            && ((65...90).contains(value2) || (97...122).contains(value2)) {
            if (65...90).contains(value1) {
                value1 += 32
            }
            if (65...90).contains(value2) {
                value2 += 32
            }
            multiSet2.append(String(UnicodeScalar(value1)!) + String(UnicodeScalar(value2)!))
        }
    }
    
    multiSet1.sort()
    multiSet2.sort()
    
    var intersectionCnt = 0
    var unionCnt = 0
    
    var index1 = 0
    var index2 = 0
    
    while (index1 < multiSet1.count) && (index2 < multiSet2.count) {
        if multiSet1[index1] == multiSet2[index2] {
            
            let criteriaStr = multiSet1[index1]
            var cnt1 = 1
            var cnt2 = 1
            
            index1 += 1
            index2 += 1
            while (index1 < multiSet1.count) && multiSet1[index1] == criteriaStr {
                cnt1 += 1
                index1 += 1
            }
            while (index2 < multiSet2.count) && multiSet2[index2] == criteriaStr {
                cnt2 += 1
                index2 += 1
            }
            
            unionCnt += cnt1 > cnt2 ? cnt1 : cnt2
            intersectionCnt += cnt1 > cnt2 ? cnt2 : cnt1
        }
        else {
            unionCnt += 1
            if multiSet1[index1] < multiSet2[index2] {
                index1 += 1
            }
            else {
                index2 += 1
            }
        }
    }
    
    for _ in index1..<multiSet1.count {
        unionCnt += 1
    }
    for _ in index2..<multiSet2.count {
        unionCnt += 1
    }

    var answer = 65536
    if unionCnt != 0{
        answer = Int((floor(Double(intersectionCnt) / Double(unionCnt)*65536.0)))
    }
    
    return answer
}
