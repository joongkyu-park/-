import Foundation

var n = Int(readLine()!)!
var puzzleCnt = 1
let dx = [0,0,1,-1]
let dy = [1,-1,0,0]
var exitFlag = false

while n>0 {
    var board = Array(repeating: Array(repeating: -1, count: 9), count: 9)
    var rowCheck = Array(repeating: Array(repeating: false, count: 10), count: 10)
    var colCheck = Array(repeating: Array(repeating: false, count: 10), count: 10)
    var squareCheck = Array(repeating: Array(repeating: false, count: 10), count: 10)
    var dominoCheck = Array(repeating: Array(repeating: false, count: 10), count: 10)
    
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ")
        let num1 = Int(input[0])!
        let position1 = Array(input[1]).map{String($0)}
        let row1 = Int(UnicodeScalar(position1[0])!.value)-65
        let col1 = Int(position1[1])!-1
        
        let num2 = Int(input[2])!
        let position2 = Array(input[3]).map{String($0)}
        let row2 = Int(UnicodeScalar(position2[0])!.value)-65
        let col2 = Int(position2[1])!-1
        
        board[row1][col1] = num1
        board[row2][col2] = num2
        dominoCheck[num1][num2] = true
        dominoCheck[num2][num1] = true
        
        rowCheck[row1][num1] = true
        colCheck[col1][num1] = true
        squareCheck[(row1/3)*3 + (col1/3)][num1] = true
        rowCheck[row2][num2] = true
        colCheck[col2][num2] = true
        squareCheck[(row2/3)*3 + (col2/3)][num2] = true
    }
    let input = readLine()!.split(separator: " ")
    for i in 0..<input.count{
        let position = Array(input[i]).map{String($0)}
        let row = Int(UnicodeScalar(position[0])!.value)-65
        let col = Int(position[1])!-1
        board[row][col] = i+1
        rowCheck[row][i+1] = true
        colCheck[col][i+1] = true
        squareCheck[(row/3)*3 + (col/3)][i+1] = true
    }
    
    
    func dfs(_ cnt: Int){
        if cnt == 81 {
            if exitFlag{
                return
            }
            exitFlag = true
            print("Puzzle \(puzzleCnt)")
            printBoard()
            puzzleCnt += 1
            return
        }
        
        let curRow = cnt / 9
        let curCol = cnt % 9
        
        if board[curRow][curCol] == -1 {
            for i in 1...9{
                if rowCheck[curRow][i] == false
                    && colCheck[curCol][i] == false
                    && squareCheck[(curRow)/3*3 + (curCol/3)][i] == false{
                    
                    for j in 0..<4{
                        let adjRow = curRow + dx[j]
                        let adjCol = curCol + dy[j]
                        
                        if (0..<9).contains(adjRow)
                            && (0..<9).contains(adjCol)
                            && board[adjRow][adjCol] == -1 {
                            for k in 1...9{
                                if rowCheck[adjRow][k] == false
                                    && colCheck[adjCol][k] == false
                                    && squareCheck[(adjRow)/3*3 + (adjCol/3)][k] == false
                                    && i != k
                                    && dominoCheck[i][k] == false{
                                    rowCheck[curRow][i] = true
                                    colCheck[curCol][i] = true
                                    squareCheck[(curRow/3)*3 + (curCol/3)][i] = true
                                    board[curRow][curCol] = i
                                    
                                    rowCheck[adjRow][k] = true
                                    colCheck[adjCol][k] = true
                                    squareCheck[(adjRow/3)*3 + (adjCol/3)][k] = true
                                    board[adjRow][adjCol] = k
                                    
                                    dominoCheck[i][k] = true
                                    dominoCheck[k][i] = true
                                    
                                    dfs(cnt + 1)
                                    
                                    board[curRow][curCol] = -1
                                    rowCheck[curRow][i] = false
                                    colCheck[curCol][i] = false
                                    squareCheck[(curRow/3)*3 + (curCol/3)][i] = false
                                    
                                    board[adjRow][adjCol] = -1
                                    rowCheck[adjRow][k] = false
                                    colCheck[adjCol][k] = false
                                    squareCheck[(adjRow/3)*3 + (adjCol/3)][k] = false
                                    
                                    dominoCheck[i][k] = false
                                    dominoCheck[k][i] = false
                                }
                            }
                        }
                    }
                }
            }
        }
        else {dfs(cnt+1)}
    }
    
    dfs(0)
    
    exitFlag = false
    n = Int(readLine()!)!
    
    func printBoard(){
        for i in 0..<9{
            for j in 0..<9{
                print(board[i][j], terminator: "")
            }
            print()
        }
    }
}
