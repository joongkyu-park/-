import Foundation

var N = Int(readLine()!)!
var matrix = [[Int]](repeating: Array(repeating: 0, count: N), count: N)
for i in 0..<N {
    var input = readLine()!.split(separator: " ").map{Int($0)!}
    for j in 0..<N {
        matrix[i][j] = input[j]
    }
}
var visited = [Int](repeating: 0, count: N)
var result = 40000

var t1 = [Int](repeating: 0, count: N/2)
var t2 = [Int](repeating: 0, count: N/2)

func dfs(_ cnt: Int, _ s: Int){
    if cnt == N/2 {
        var t1Index = 0
        var t2Index = 0
        
        for i in 0..<N {
            if visited[i]==0{
                t1[t1Index] = i
                t1Index += 1
            }
            else{
                t2[t2Index] = i
                t2Index += 1
            }
        }
        
        var t1Sum = 0
        var t2Sum = 0
        
        for i in 0..<N/2{
            for j in 0..<N/2{
                if i == j {
                    continue
                }
                else {
                    t1Sum += matrix[t1[i]][t1[j]]
                    t2Sum += matrix[t2[i]][t2[j]]
                }
            }
        }
        if result > abs(t1Sum-t2Sum){
            result = abs(t1Sum-t2Sum)
        }
        return
    }
    
    for i in s..<N {
        if visited[i]==0{
            visited[i]=1
            dfs(cnt+1, i+1)
            visited[i]=0
        }
    }
}

dfs(0,0 )

print(result)
