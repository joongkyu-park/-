
import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let N = input[0]
let M = input[1]
var visited = [Int](repeating: 0, count: N+1)
var arr = [Int](repeating: -1, count: M)

func dfs(_ s: Int, _ cnt: Int){
    
    if cnt == M {
        for i in 0..<M{
            print(arr[i], terminator: " ")
        }
        print()
        return
    }
    
    if s == N+1{
        return
    }
    
    for i in s...N {
        if visited[i] == 0 {
            visited[i] = 1
            arr[cnt] = i
            dfs(i+1, cnt+1)
            visited[i] = 0
        }
    }
}


dfs(1, 0)
        

