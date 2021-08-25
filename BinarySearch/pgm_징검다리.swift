/*
 참고 : https://tngusmiso.tistory.com/38
 어려운 문제. 바위를 제거해나가는게 아니라, 역으로 거리를 이분탐색으로 줄어가는 방식.
    -> 문제 푸는 아이디어가 잘 생각이 안난다면 역으로 접근해볼생각도 해보자!
 */
import Foundation

func solution(_ distance:Int, _ rocks:[Int], _ n:Int) -> Int {
    let rocks = rocks.sorted()
    var answer = 1
    var start = 1
    var end = distance
    
    while(start <= end) {
        let mid = (start+end)/2
        var indicator = 0
        var removeCnt = 0
        
        // mid보다 거리가 짧으면 바위 제거
        for rock in rocks {
            if rock-indicator < mid {
                removeCnt += 1
                if removeCnt > n { break }
            } else {
                indicator = rock
            }
        }
        
        // 마지막 바위와 도착점 사이 거리 계산
        if distance - indicator < mid {
            removeCnt += 1
        }
        
        // 제거한 바위가 n이하라면 mid가 최소값이 될 수 있다.
        if removeCnt <= n {
            answer = mid
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    
    return answer
}
