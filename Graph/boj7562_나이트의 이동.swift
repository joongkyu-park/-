import Foundation


//입력 받기
var input = readLine()!.split(separator: " ").map{(Int($0)!)}
var n: Int = input[0]
var m: Int = input[1]

//섬정보 배열, 방문 배열, search함수
var mtrx = Array(repeating: Array(repeating: 0, count: n), count: m)
var visited = Array(repeating: Array(repeating: 0, count: n), count: m)
func search(_ x: Int, _ y: Int){
    
    //아래
    if x+1 < m && visited[x+1][y] == 0 && mtrx[x+1][y] == 1{
        visited[x+1][y] = 1
        search(x+1, y)
    }
    //위
    if x-1 >= 0 && visited[x-1][y] == 0 && mtrx[x-1][y] == 1{
        visited[x-1][y] = 1
        search(x-1, y)
    }
    //왼쪽
    if y-1 >= 0 && visited[x][y-1] == 0 && mtrx[x][y-1] == 1{
        visited[x][y-1] = 1
        search(x, y-1)
    }
    //오른쪽
    if y+1 < n && visited[x][y+1] == 0 && mtrx[x][y+1] == 1{
        visited[x][y+1] = 1
        search(x, y+1)
    }
    //오른쪽 아래 대각선
    if x+1 < m && y+1 < n && visited[x+1][y+1] == 0 && mtrx[x+1][y+1] == 1{
        visited[x+1][y+1] = 1
        search(x+1, y+1)
    }
    //왼쪽 아래 대각선
    if y-1 >= 0 && x+1 < m && visited[x+1][y-1] == 0 && mtrx[x+1][y-1] == 1{
        visited[x+1][y-1] = 1
        search(x+1, y-1)
    }
    //오른쪽 위 대각선
    if x-1 >= 0 && y+1 < n && visited[x-1][y+1] == 0 && mtrx[x-1][y+1] == 1{
        visited[x-1][y+1] = 1
        search(x-1, y+1)
    }
    //왼쪽 위 대각선
    if y-1 >= 0 && x-1 >= 0 && visited[x-1][y-1] == 0 && mtrx[x-1][y-1] == 1{
        visited[x-1][y-1] = 1
        search(x-1, y-1)
    }
    
    return
}

var result = 0

while n != 0 && m != 0 {
    //섬의 정보 입력 받기
    for i in 0..<m {
        var row = readLine()!.split(separator: " ").map{(Int($0)!)}
        for j in 0..<n {
            mtrx[i][j] = row[j]
        }
    }
    
    for i in 0..<m {
        for j in 0..<n {
            if visited[i][j] == 0 && mtrx[i][j] == 1{
                visited[i][j] = 1
                search(i, j)
                result += 1
            }
        }
    }
    
    print(result)
    
    
    //다음 입력 받기, 초기화
    input = readLine()!.split(separator: " ").map{(Int($0)!)}
    n = input[0]
    m = input[1]
    result = 0
    mtrx = Array(repeating: Array(repeating: 0, count: n), count: m)
    visited = Array(repeating: Array(repeating: 0, count: n), count: m)
}

