import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}

let N = input[0]
let M = input[1]

var nums = readLine()!.split(separator: " ").map{Int($0)!}
nums.sort()

var visted = [Int](repeating: 0, count: N)

var result = ""

func dfs(_ s: Int, _ cnt: Int, _ str: String){
    
    if cnt == M {
        result += str + "\n"
        return
    }
    for i in s..<N {
        if visted[i] == 0{
            visted[i] = 1
            dfs(i+1, cnt+1,str+"\(nums[i]) ")
            visted[i] = 0
        }
    }
}
dfs(0, 0, "")
print(result)
