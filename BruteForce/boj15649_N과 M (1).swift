/*
 백트래킹 개념 : https://idea-sketch.tistory.com/29
 문제풀이 : https://cryptosalamander.tistory.com/54
 */
import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let N = input[0]
let M = input[1]
var visited = [Int](repeating: 0, count: N+1)
var arr = [Int](repeating: -1, count: M)
func dfs(_ cnt: Int){
    
    if cnt == M {
        for i in 0..<arr.count{
            print(arr[i], terminator: " ")
        }
        print()
        return
    }
    
    for i in 1...N {
        if visited[i] == 0 {
            visited[i] = 1
            arr[cnt] = i
            dfs(cnt+1)
            visited[i] = 0
        }
    }
}

dfs(0)
