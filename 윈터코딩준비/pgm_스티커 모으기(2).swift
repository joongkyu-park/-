import Foundation

func solution(_ sticker:[Int]) -> Int{
    var answer = 0
    
    var dp1 = [Int](repeating: 0, count: sticker.count)
    var dp2 = [Int](repeating: 0, count: sticker.count)
    
    if sticker.count == 1{
        return sticker[0]
    }
    else if sticker.count == 2 {
        answer = max(sticker[0], sticker[1])
        return answer
    }
    else if sticker.count == 3 {
        answer = max(sticker[0], sticker[1],sticker[2])
        return answer
    }
    else {
        dp1[0] = sticker[0]
        dp1[1] = dp1[0]
        
        dp2[0] = 0
        dp2[1] = sticker[1]
        
        for i in 2..<sticker.count {
            if i == sticker.count-1{
                dp1[i] = dp1[i-1]
                dp2[i] = max(dp2[i-2]+sticker[i], dp2[i-1])
            }
            else {
                dp1[i] = max(dp1[i-2]+sticker[i], dp1[i-1])
                dp2[i] = max(dp2[i-2]+sticker[i], dp2[i-1])
            }
        }
        
        answer = dp1[sticker.count-1] > dp2[sticker.count-1] ? dp1[sticker.count-1] : dp2[sticker.count-1]
        
        return answer
    }
    
}
