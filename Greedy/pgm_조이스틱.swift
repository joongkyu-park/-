import Foundation

func solution(_ name:String) -> Int {
    let nameArr = Array(name).map {String($0)}
    let n = Array(name).count
    
    var answerCheck = Array(repeating: false, count: n)
    var answer = 2147483647
    
    
    func dfs(_ cursor: Int, _ cnt: Int, _ answerArr: [String]) {
        var curArr = answerArr
        var curCnt = cnt
        answerCheck[cursor] = true
        
        if nameArr[cursor] != "A" {
            let position = Int(UnicodeScalar(nameArr[cursor])!.value)
            if position <= 78 {
                curCnt += position-65
            } else {
                curCnt += 26-(position-65)
            }
        }
        curArr[cursor] = nameArr[cursor]
        
        if nameArr == curArr {
            if curCnt < answer {
                answer = curCnt
            }
            answerCheck[cursor] = false
            return
        }
        
        //왼쪽
        var left = cursor
        var leftCurCnt = curCnt
        while answerCheck[left] == true {
            left -= 1
            if left < 0 {
                left = n-1
            }
            leftCurCnt += 1
        }
        dfs(left, leftCurCnt, curArr)
        
        
        //오른쪽
        var right = cursor
        var rightCurCnt = curCnt
        while answerCheck[right] == true {
            right += 1
            if right >= n {
                right = 0
            }
            rightCurCnt += 1
        }
        dfs(right, rightCurCnt, curArr)
        
        answerCheck[cursor] = false
        
    }
    
    var startArr = [String]()
    for _ in 0..<n {
        startArr.append("A")
    }
    
    if startArr == nameArr {
        return 0
    }
    else{
        dfs(0, 0, startArr)
        
        return answer
    }
