import Foundation

var N = Int(readLine()!)!
var arr = [[Int]](repeating: Array(repeating: 0, count: 2), count: N)
for i in 0..<N {
    var input = readLine()!.split(separator: " ").map{Int($0)!}
    arr[i][0] = input[0]
    arr[i][1] = input[1]
}
var visited = [Int](repeating: 0, count: N)

var result = 0

func dfs(_ start: Int){
    for i in start...N{
        if start >= N {
            var sum = 0
            for j in 0..<N {
                if visited[j] == 1{
                    sum += arr[j][1]
                }
            }
            if sum > result {
                result = sum
            }
            return
        }
        else if i >= N {
            continue
        }
        else if visited[i] == 0 && i + arr[i][0] <= N{
            visited[i] = 1
            dfs(i + arr[i][0])
            visited[i] = 0
        }
        else {
            var sum = 0
            for i in 0..<N {
                if visited[i] == 1{
                    sum += arr[i][1]
                }
            }
            if sum > result {
                result = sum
            }
        }
    }
}

dfs(0)

print(result)
