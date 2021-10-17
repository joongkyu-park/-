import Foundation

let N = Int(readLine()!)!
var input = readLine()!.split(separator: " ").map{Int($0)!}
input.sort()

var arr = [Int](repeating: 0, count: N)
var visited = [Int](repeating: 0, count: N)
var result = -1

func dfs(_ cnt: Int){
    if cnt == N{
        var sum = 0
        for i in 0..<arr.count-1{
            sum += abs(arr[i]-arr[i+1])
        }
        if sum > result{
            result = sum
        }
        return
    }
    
    for i in 0..<N {
        if visited[i] == 0 {
            visited[i] = 1
            arr[cnt] = input[i]
            dfs(cnt+1)
            visited[i] = 0
        }
    }
}

dfs(0)

print(result)
