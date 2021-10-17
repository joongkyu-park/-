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

func dfs(_ t1: inout [Int], _ t2: inout [Int], _ cnt: Int, _ s: Int, _ num: Int){
    if cnt == N-num {
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
        
        for i in 0..<num{
            for j in 0..<num{
                t1Sum += matrix[t1[i]][t1[j]]
            }
        }
        for i in 0..<N-num{
            for j in 0..<N-num{
                t2Sum += matrix[t2[i]][t2[j]]
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
            dfs(&t1,&t2,cnt+1, i+1, num)
            visited[i]=0
        }
    }
}

for i in 1..<N{
    var t1 = [Int](repeating: 0, count: i)
    var t2 = [Int](repeating: 0, count: N-i)
    dfs(&t1,&t2,0,0,i)
    for j in 0..<visited.count{
        visited[j] = 0
    }
}
print(result)
