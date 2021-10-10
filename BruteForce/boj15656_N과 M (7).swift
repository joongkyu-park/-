import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}

let N = input[0]
let M = input[1]

var nums = readLine()!.split(separator: " ").map{Int($0)!}
nums.sort()

var result = ""

func dfs(_ cnt: Int, _ str: String){
    
    if cnt == M {
        result += str + "\n"
        return
    }
    for i in 0..<N {
        dfs(cnt+1,str+"\(nums[i]) ")
    }
}
dfs(0, "")
print(result)
