//참고 : https://chanho0912.tistory.com/43
let n = Int(readLine()!)!

var board = [[Int]]()

for _ in 0..<n{
    let input = Array(readLine()!).map{String($0)}
    var arr = [Int]()
    for i in 0..<n {
        // H:0
        if input[i] == "H"{
            arr.append(0)
        }
        // T:1
        else {
            arr.append(1)
        }
    }
    board.append(arr)
}

var answer = 20*20+1
//비트마스킹을 이용해 2^n가지의 행을 뒤집는 경우의 수를 탐색
for i in 0..<(1<<n){
    var tmpBoard = board
    for j in 0..<n{
        if (1<<j) & i > 0{
            for k in 0..<n{
                tmpBoard[j][k] = abs(tmpBoard[j][k]-1)
            }
        }
    }
    var sum = 0
    
    for j in 0..<n{
        var colSum = 0
        for k in 0..<n{
            colSum += tmpBoard[k][j]
        }
        if colSum > abs(n-colSum){
            colSum = abs(n-colSum)
        }
        sum += colSum
    }
    if sum < answer{
        answer = sum
    }
}

print(answer)
