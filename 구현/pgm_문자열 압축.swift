// 리팩토링 할 필요 있음..

import Foundation

func solution(_ s:String) -> Int {
    let sArr = Array(s).map{String($0)}
    var result = sArr.count
    
    var unit = 1
    var criteriaString = ""
    var compareString = ""
    var resultStr = ""
    
    while unit < sArr.count {
        
        var flag = false
        var index = 0
        var cnt = 0
        var curResult = 0
        
        criteriaString = ""
        compareString = ""
        
        while index < sArr.count {
            if index+unit <= sArr.count{
                if flag {
                    compareString = ""
                    for i in index..<index+unit {
                        compareString += sArr[i]
                    }
                    if criteriaString == compareString {
                        cnt += 1
                    }
                    else {
                        criteriaString = compareString
                        
                        if cnt >= 1 {
                            curResult += unit
                            curResult += (Array("\(cnt+1)").count)
                            cnt = 0
                        }
                        else {
                            curResult += unit
                        }
                    }
                }
                else {
                    criteriaString = ""
                    for i in index..<index+unit {
                        criteriaString += sArr[i]
                    }
                    curResult += unit
                    flag = true
                }
            }
            else {
                for _ in index..<sArr.count {
                    curResult += 1
                }
            }
            index += unit
        }
        if cnt >= 1{
            curResult += (Array("\(cnt+1)").count)
        }
        
        if curResult < result {
            result = curResult
        }
        
        unit += 1
    }
    return result
}
