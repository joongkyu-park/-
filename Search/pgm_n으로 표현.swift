// https://velog.io/@kerri/Swift-%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%A8%B8%EC%8A%A4Lv3-N%EC%9C%BC%EB%A1%9C-%ED%91%9C%ED%98%84

import Foundation

func solution(_ N:Int, _ number:Int) -> Int {
    if N == number {
        return 1
    }
    
    var answer: Int = -1
        
    func dfs(_ count: Int, _ now: Int) {
        if count > 8 { return }
        if now == number {
            if count < answer || answer == -1 {
                answer = count
            }
            return
        }
        
        var NN = 0
        for i in 0..<8 {
            if answer != -1 && answer < count + 1 + i {
                break
            }
            NN = NN*10 + N
            dfs(count + 1 + i, now + NN)
            dfs(count + 1 + i, now - NN)
            dfs(count + 1 + i, now * NN)
            dfs(count + 1 + i, now / NN)
        }
    }
    
    dfs(0, 0)
    
    return answer
}
