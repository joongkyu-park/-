import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}

let N = input[0]
let M = input[1]

var result = ""
func dfs(_ s: Int, _ cnt: Int,_ sequence: String){
    
    if cnt == M {
        result += "\(sequence)\n"
        return
    }
    
    for i in s...N {
        dfs(i, cnt+1,sequence + "\(i) ")
    }
}

dfs(1, 0,"")
print(result)
