//22.02.27 업데이트!
import Foundation

let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nm[0]
let m = nm[1]

var board = [[Int]]()
for _ in 0..<n{
    let input = Array(readLine()!).map{Int(String($0))!}
    board.append(input)
}

var row = ""
var col = ""
var sum = 0
var maxSum = 0


for mask in 0..<(1<<(n*m)){
    //0:가로, 1:세로
    for i in 0..<n{
        for j in 0..<m{
            let index = i*m+j
            if mask & (1<<index) == 0{
                row += String(board[i][j])
            }
            else {
                if row != ""{
                    sum += Int(row)!
                }
                row = ""
            }
        }
        if row != ""{
            sum += Int(row)!
        }
        row = ""
    }
    
    for j in 0..<m{
        for i in 0..<n{
            let index = i*m+j
            if mask & (1<<index) > 0{
                col += String(board[i][j])
            }
            else {
                if col != ""{
                    sum += Int(col)!
                }
                col = ""
            }
        }
        if col != ""{
            sum += Int(col)!
        }
        col = ""
    }
    if sum > maxSum{
        maxSum = sum
    }
    sum = 0
}

print(maxSum)
