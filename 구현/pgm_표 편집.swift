/*
 논리는 맞지만, 효율성 절반
 -> while문으로 배열의 인덱스를 1씩 조절해가며 삭제된 행을 처리하는 것이 시간초과의 원인.
 따라서 U나 D가 x라면 x이상의 연산(최대 n)을 해야하고,
 Z와 D도 최대 n만큼의 연산을 해야함.
 
import Foundation

func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    var curIndex = k
    var isDeleted = Array(repeating: 0, count: n)
    var answer = ""
    var deleteStack = [Int]()
    
    for c in cmd {
        let curCmd = c.split(separator: " ").map{String($0)}
        
        if curCmd[0] == "D" {
            var move = Int(curCmd[1])!
            
            while move > 0 {
                if isDeleted[curIndex+1] == 0 {
                    move -= 1
                    curIndex += 1
                }
                else { curIndex += 1}
            }
            
        }
        else if curCmd[0] == "U" {
            var move = Int(curCmd[1])!
            while move > 0 {
                if isDeleted[curIndex-1] == 0 {
                    move -= 1
                    curIndex -= 1
                }
                else { curIndex -= 1}
            }
        }
        else if curCmd[0] == "Z" {
            let restoreIndex = deleteStack.popLast()!
            isDeleted[restoreIndex] = 0
        }
        else if curCmd[0] == "C" {
            isDeleted[curIndex] = 1
            deleteStack.append(curIndex)
            
            let originalIndex = curIndex
            while curIndex < n {
                if isDeleted[curIndex] == 1 {
                    curIndex += 1
                }
                else {break}
            }
            if curIndex == n {
                curIndex = originalIndex
                while curIndex >= 0 {
                    if isDeleted[curIndex] == 1 {
                        curIndex -= 1
                    }
                    else {break}
                }
            }
        }
        
    }
    
    for i in isDeleted {
        if i == 1 {
            answer += "X"
        }
        else {answer += "O"}
    }
    
    return answer
}
*/


/*
각 원소의 [이전 원소 인덱스], [다음 원소 인덱스]를 저장하는 링크 배열을 만들고,
 원소가 삭제/복구 될때마다 원소의 링크를 업데이트.
 U나 D로 이동 시 링크의 인덱스를 따라서 이동, x번 이동 시 x번 연산
 Z나 C 때는 링크 업데이트만 해주므로 O(1)
 -> C(삭제)일 때는 삭제되는 원소의 링크를 이용해 앞 뒤 원소를 이어주고,
 Z(복구)일 때는 '가장 나중에 삭제된 원소를 복구'하는 특징을 이용하면 삭제되었던 원소의 링크를 그대로 복구시켜주고 앞뒤 원소를 다시 이어주면 된다.
 */
import Foundation

func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    var curIndex = k
    var isDeleted = Array(repeating: 0, count: n)
    var link = Array(repeating: [-1,-1], count: n)
    for i in 0..<link.count {
        link[i][0] = i-1
        link[i][1] = i+1
    }
    var answer = ""
    var deleteStack = [Int]()
    
    for c in cmd {
        let curCmd = c.split(separator: " ").map{String($0)}
        
        if curCmd[0] == "D" {
            var move = Int(curCmd[1])!
            
            while move > 0 {
                curIndex = link[curIndex][1]
                move -= 1
            }
            
        }
        else if curCmd[0] == "U" {
            var move = Int(curCmd[1])!
            
            while move > 0 {
                curIndex = link[curIndex][0]
                move -= 1
            }
        }
        else if curCmd[0] == "Z" {
            
            let restoreIndex = deleteStack.popLast()!
            isDeleted[restoreIndex] = 0
            
            let restoreUpLink = link[restoreIndex][0]
            let restoreDownLink = link[restoreIndex][1]
        
            if restoreUpLink != -1 {
                link[restoreUpLink][1] = restoreIndex
            }
            if restoreDownLink != n {
                link[restoreDownLink][0] = restoreIndex
            }
        }
        else if curCmd[0] == "C" {
            isDeleted[curIndex] = 1
            deleteStack.append(curIndex)
            
            let upLink = link[curIndex][0]
            let downLink = link[curIndex][1]
            
            if upLink != -1 {
                link[upLink][1] = downLink
            }
            if downLink != n {
                link[downLink][0] = upLink
            }
            
            if downLink != n {
                curIndex = downLink
            }
            else {
                curIndex = upLink
            }
        }
        
    }
    
    for i in isDeleted {
        if i == 1 {
            answer += "X"
        }
        else {answer += "O"}
    }
    
    return answer
}
