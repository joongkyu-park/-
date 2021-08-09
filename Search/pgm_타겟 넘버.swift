/*
 참고 : https://gimjinging.tistory.com/134
 
 경우의 수를 체크해보니 트리형태로 나온다 -> search!
 + guard문의 사용법
 */

import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var result: Int = 0

    func DFS(_ index: Int,_ sum: Int) {
        if index == numbers.count - 1 && sum == target {
            result += 1
            return
        }
        
        guard index + 1 < numbers.count else {return}
        
        DFS(index + 1, sum + numbers[index + 1])
        DFS(index + 1, sum - numbers[index + 1])
    }
    
    DFS(-1, 0)
    
    return result
    
}
