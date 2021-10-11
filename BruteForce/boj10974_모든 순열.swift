import Foundation

let N = Int(readLine()!)!

var visited = [Int](repeating: 0, count: N+1)
var arr = [Int](repeating: 0, count: N+1)
var result = ""

func dfs(_ cnt: Int){
    if cnt == N{
        var str = ""
        for i in 0..<N{
            str += "\(arr[i]) "
        }
        result += str + "\n"
    }
    
    for i in 1...N {
        if visited[i]==0{
            visited[i]=1
            arr[cnt] = i
            dfs(cnt+1)
            visited[i]=0
        }
    }
}

dfs(0)

print(result)
