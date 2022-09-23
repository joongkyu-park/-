import Foundation

func solution(_ play_time:String, _ adv_time:String, _ logs:[String]) -> String {
    
    let playTimeArr = play_time.split(separator: ":").map{Int(String($0))!}
    let maxTime = playTimeArr[0]*3600 + playTimeArr[1]*60 + playTimeArr[2]
    var cumulativeSumArr = Array(repeating: 0, count: maxTime+1)
    
    for log in logs {
        let logArr = log.split(separator: "-").map{String($0)}
        let startArr = logArr[0].split(separator: ":").map{Int(String($0))!}
        let endArr = logArr[1].split(separator: ":").map{Int(String($0))!}
        
        let start = startArr[0]*3600 + startArr[1]*60 + startArr[2]
        let end = endArr[0]*3600 + endArr[1]*60 + endArr[2]
        
        cumulativeSumArr[start] += 1
//        if end+1 > maxTime { continue }
        cumulativeSumArr[end] -= 1
    }
    for i in 1...maxTime {
        cumulativeSumArr[i] += cumulativeSumArr[i-1]
    }
    
    let advTimeArr = adv_time.split(separator: ":").map{Int(String($0))!}
    let advTime = advTimeArr[0]*3600 + advTimeArr[1]*60 + advTimeArr[2]
    
    var answer = 0 //start Time
    var totalTime = 0
    for i in 0..<advTime {
        totalTime += cumulativeSumArr[i]
    }
    if advTime != maxTime {
        var curTotalTime = totalTime
        for i in advTime..<maxTime {
            curTotalTime = curTotalTime + cumulativeSumArr[i] - cumulativeSumArr[i - (advTime)]
            if curTotalTime > totalTime {
                answer = i - advTime + 1
                totalTime = curTotalTime
            }
        }
    }
    
    let hour = answer/3600
    answer %= 3600
    let min = answer/60
    answer %= 60
    let sec = answer
    
    
    var answerStr = ""
    if String(hour).count == 1{
        answerStr += "0"
    }
    answerStr += String(hour)
    answerStr += ":"
    if String(min).count == 1{
        answerStr += "0"
    }
    answerStr += String(min)
    answerStr += ":"
    if String(sec).count == 1{
        answerStr += "0"
    }
    answerStr += String(sec)
    
    return answerStr
}
