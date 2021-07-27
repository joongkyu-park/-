 /*
  - 괜히 바보같이 생각했다가 어려워진 문제.
  각 옷 종류의 개수에 입지않는 경우도 추가하여 다 곱한다. 그리고 아무것도 입지 않는 경우의수 1개를 빼면 된다.
  즉 (a종류의 옷 개수 + 1) * (b종류의 옷 개수 + 1) * ... - 1
  
  - dictionary 타입 자료형에 key가 있을 때, 없을 때로 구분하여 생각
  
  -
  */
 import Foundation
 
 func solution(_ clothes:[[String]]) -> Int {
    
    
    var dic: [String:Int] = [:]
    for cloth in clothes {
        if dic[cloth[1]] != nil {
            dic[cloth[1]]! += 1
        } else {
            dic[cloth[1]] = 1
        }
        
    }
    var count: Int = 1
    for (_, value) in dic {
        count *= (value + 1)
    }
    return  count - 1
    
 }
