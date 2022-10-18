import Foundation

let board = Array(readLine()!).map { String($0) }
var answer = Array(repeating: ".", count: board.count)

var isCompleted = true
var index = 0
while index < board.count {
    if board[index] == "X" {
        if (0..<board.count).contains(index+3) {
            if board[index+1] == "X" && board[index+2] == "X" && board[index+3] == "X" {
                answer[index] = "A"
                answer[index+1] = "A"
                answer[index+2] = "A"
                answer[index+3] = "A"
                index += 4
            }
            else if board[index+1] == "X" {
                answer[index] = "B"
                answer[index+1] = "B"
                index += 2
            }
            else {
                isCompleted = false
                break
            }
        }
        else if (0..<board.count).contains(index+1) {
            if board[index+1] == "X" {
                answer[index] = "B"
                answer[index+1] = "B"
                index += 2
            }
            else {
                isCompleted = false
                break
            }
        }
        else {
            isCompleted = false
            break
        }
    }
    else {
        index += 1
    }
}
if isCompleted {
    print(answer.reduce(""){ $0+$1 })
}
else {
    print(-1)
}
