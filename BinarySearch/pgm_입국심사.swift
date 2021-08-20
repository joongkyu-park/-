/*
 이분탐색 사용이전에 아이디어를 떠올리는게 굉장히 중요했던 문제. 아직 한 번에 딱 이해가지 않는다.
 
 또 앞으로 while문의 조건은 true에 중간에 break를 넣지말고, while문 조건에 식을 넣자.
 */

import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    var times = times
    times.sort{$0 < $1}
    var min = 1
    var max = n * times[times.count-1]
    var result = -1
    
    while min <= max {
        var mid = (max + min)/2
        var sum = 0
        for time in times {
            sum += mid / time
        }
        if sum < n {
            min = mid + 1
        }
        else {
            max = mid - 1
            result = mid
        }
        
    }
    return Int64(result)
}
