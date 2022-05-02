import Foundation

func solution(_ n:Int, _ t:Int, _ m:Int, _ timetable:[String]) -> String {
    var tt = [Int]()
    
    var remainCnt = n
    var curTime = 9*60
    var curOnBoard = 0
    var answerTime = -1
    var answer = ""
    var lastTime = -1
    
    for time in timetable {
        let arr = time.split(separator: ":").map{Int(String($0))!}
        tt.append(arr[0]*60+arr[1])
    }
    tt.sort()
    
    while remainCnt >= 0 {
        if remainCnt == 1 || tt.isEmpty {
            
            for time in tt {
                if time <= curTime && curOnBoard < m{
                    lastTime = tt.removeFirst()
                    curOnBoard += 1
                }
                else {
                    break
                }
            }
            
            
            if curOnBoard < m {
                answerTime = curTime
            }
            else {
                answerTime = lastTime-1
                remainCnt -= 1
                while remainCnt > 1 {
                    curTime += t
                    remainCnt -= 1
                    answerTime = curTime
                }
                
            }
            
            break
        }
        else {
            for time in tt {
                if time <= curTime && curOnBoard < m{
                    lastTime = tt.removeFirst()
                    curOnBoard += 1
                }
                else {
                    break
                }
            }
            curTime += t
            curOnBoard = 0
            remainCnt -= 1
        }
    }
    
    var hour = 0
    var min = 0
    
    hour = answerTime / 60
    answerTime -= hour*60
    if answerTime >= 60 {
        hour += 1
        answerTime -= 60
    }
    min = answerTime
    
    let hourStr = hour < 10 ? "0\(hour)" : "\(hour)"
    let minStr = min < 10 ? "0\(min)" : "\(min)"
    answer = "\(hourStr):\(minStr)"
    return answer
}
