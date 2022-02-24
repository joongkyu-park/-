//이해안가면 검색해서 개념 참조
import Foundation

let n = Int(readLine()!)!
var board = Array(repeating: -1, count: n)

var answer = 0
func search(_ cnt: Int){
    if cnt == n{
        answer += 1
        return
    }
    var flag = true
    
    for i in 0..<n {
        flag = true
        for j in 0..<cnt {
            if board[j] == i || abs(j-cnt) == abs(board[j]-i) {
                flag = false
                break
            }
        }
        if flag {
            board[cnt] = i
            search(cnt+1)
        }
    }
}

for i in 0..<n {
    board[0] = i
    search(1)
}

print(answer)
