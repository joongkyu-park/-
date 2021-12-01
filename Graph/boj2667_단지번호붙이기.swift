import Foundation

let n = Int(readLine()!)!

var mtrx = Array(repeating: Array<Int>(), count: n)

for i in 0..<n{
    let input = Array(readLine()!.map{Int(String($0))!})
    for j in 0..<n{
        mtrx[i].append(input[j])
    }
}

var visited = Array(repeating: Array(repeating: 0, count: n), count: n)
var localNumArr = Array<Int>()
var totallocalNum = 0
var localNum = 1

func dfs(_ x: Int, _ y: Int){
    // x+1, y
    if x+1 < n {
        if visited[x+1][y] == 0 && mtrx[x+1][y] == 1{
            visited[x+1][y] = 1
            localNum += 1
            dfs(x+1, y)
        }
    }
    
    // x-1, y
    if x-1 >= 0 {
        if visited[x-1][y] == 0 && mtrx[x-1][y] == 1{
            visited[x-1][y] = 1
            localNum += 1
            dfs(x-1, y)
        }
    }
    
    // x, y+1
    if y+1 < n {
        if visited[x][y+1] == 0 && mtrx[x][y+1] == 1{
            visited[x][y+1] = 1
            localNum += 1
            dfs(x, y+1)
        }
    }
    
    // x, y-1
    if y-1 >= 0 {
        if visited[x][y-1] == 0 && mtrx[x][y-1] == 1{
            visited[x][y-1] = 1
            localNum += 1
            dfs(x, y-1)
        }
    }
}


for i in 0..<n {
    for j in 0..<n{
        if visited[i][j] == 0 && mtrx[i][j] == 1{
            visited[i][j] = 1
            dfs(i, j)
            totallocalNum += 1
            localNumArr.append(localNum)
            localNum = 1
        }
    }
}

print(totallocalNum)
localNumArr.sort()
for localNum in localNumArr{
    print(localNum)
}
