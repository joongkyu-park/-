import Foundation

let N = Int(readLine()!)!

var matrix = [[Int]](repeating: Array(repeating: 0, count: N), count: N)

for i in 0..<N{
    var input = readLine()!.split(separator: " ").map{Int($0)!}
    for j in 0..<N{
        matrix[i][j] = input[j]
    }
}

var visited = [Int](repeating: 0, count: N)
var arr = [Int](repeating: 0, count: N)
var result = 10000001

func dfs(_ cnt: Int, _ start: Int, _ origin: Int){
    if cnt == N && matrix[start][origin] > 0{
        arr[cnt-1] = matrix[start][origin]
        
        var sum = 0
        for i in 0..<N{
            sum += arr[i]
        }
        if sum < result {
            result = sum
        }
        return
    }
    else if cnt == N {
        return
    }
        
    for i in 0..<N{
        if visited[i] == 0 && matrix[start][i] > 0{
            visited[i] = 1
            arr[cnt-1] = matrix[start][i]
            dfs(cnt+1, i, origin)
            visited[i] = 0
        }
    }
}

for i in 0..<N {
    visited[i] = 1
    dfs(1, i, i)
    visited[i] = 0
}

print(result)
