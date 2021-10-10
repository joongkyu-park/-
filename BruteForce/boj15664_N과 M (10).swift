import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}

let N = input[0]
let M = input[1]

var nums = readLine()!.split(separator: " ").map{Int($0)!}
nums.sort()

var visted = [Int](repeating: 0, count: N)
var arr = [String]()

func dfs(_ s: Int, _ cnt: Int, _ str: String){
    
    if cnt == M {
        arr.append(str)
        return
    }
    var prev_num = -1
    for i in s..<N {
        if visted[i]==0 && prev_num != nums[i]{
            visted[i]=1
            prev_num = nums[i]
            dfs(i+1,cnt+1,str+"\(nums[i]) ")
            visted[i]=0
        }
        
    }
}
dfs(0, 0, "")

for i in 0..<arr.count{
    print(arr[i])
}
