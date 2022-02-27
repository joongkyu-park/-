// 중복체크를 배열로
// 다른 언어로는 맞는데 swift로 하면 틀린단다..ㅠㅠ
import Foundation

let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nm[0]
let m = nm[1]

var board = Array(repeating: Array(repeating: -1, count: m), count: n)
var alphabetCheck = Array(repeating: false, count: 26)
var visited = Array(repeating: Array(repeating: false, count: m), count: n)

let dx = [0,0,1,-1]
let dy = [1,-1,0,0]

for i in 0..<n{
    let input = Array(readLine()!).map{String($0)}
    for j in 0..<m{
        board[i][j] = Int(UnicodeScalar(input[j])!.value)-65
    }
}

var maxCnt = 0
func dfs(_ cnt: Int, _ curRow: Int, _ curCol: Int) {
    var flag = true
    for i in 0..<4{
        let nextRow = curRow + dx[i]
        let nextCol = curCol + dy[i]

        if (0..<n).contains(nextRow)
            && (0..<m).contains(nextCol){
            if alphabetCheck[board[nextRow][nextCol]] == false
                && visited[nextRow][nextCol] == false {
                flag = false

                alphabetCheck[board[nextRow][nextCol]] = true
                visited[nextRow][nextCol] = true
                dfs(cnt+1, nextRow, nextCol)
                alphabetCheck[board[nextRow][nextCol]] = false
                visited[nextRow][nextCol] = false
            }
        }
    }
    if flag {
        if cnt > maxCnt{
            maxCnt = cnt
        }
    }
}
alphabetCheck[board[0][0]] = true
visited[0][0] = true
dfs(1, 0, 0)
print(maxCnt)


// 중복체크를 비트마스킹으로
// https://codinggorani.com/%EB%B0%B1%EC%A4%80%20boj/2021/09/15/problem-solve-1987.html
// 노트북으로 돌리면 둘 다 느린데.. 참 알 수 없다.
let RC = readLine()!.split(separator: " ").map { Int(String($0))! }
let R = RC[0], C = RC[1]
var map = Array(repeating: [Int](), count: R)
let dy = [-1, 1, 0, 0]
let dx = [0, 0, -1, 1]
var answer = 0
for i in 0..<R {
    map[i] = readLine()!.map { Int($0.asciiValue!) - 65 }
}
func DFS(_ y: Int, _ x: Int, _ count: Int, _ alphabet: Int) {
    answer = max(answer, count)
    for i in 0..<4 {
        let nextY = y + dy[i]
        let nextX = x + dx[i]
        if nextY < 0 || nextY >= R || nextX < 0 || nextX >= C {
            continue
        }
        let n = 1 << map[nextY][nextX]
        if alphabet & n == 0 {
            DFS(nextY, nextX, count + 1, alphabet | n)
        }
    }
}
DFS(0, 0, 1, 1 << map[0][0])
print(answer)
