import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])

var board = [[Int]]()
for _ in 0..<n {
    let row = readLine()!.split(separator: " ").map { Int(String($0))! }
    board.append(row)
}

for r in 0..<n {
    for c in 1..<m {
        board[r][c] += board[r][c-1]
    }
}

for c in 0..<m {
    for r in 1..<n {
        board[r][c] += board[r-1][c]
    }
}

var answer = Int.min
for r1 in 0..<n {
    for c1 in 0..<m {
        for r2 in r1..<n {
            for c2 in c1..<m {
                var sum = board[r2][c2]
                if (0..<n).contains(r1-1) {
                    sum -= board[r1-1][c2]
                }
                if (0..<m).contains(c1-1) {
                    sum -= board[r2][c1-1]
                }
                if (0..<n).contains(r1-1) && (0..<m).contains(c1-1) {
                    sum += board[r1-1][c1-1]
                }
                if sum > answer {
                    answer = sum
                }
            }
        }
    }
}

print(answer)
