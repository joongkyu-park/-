import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}

let N = input[0]
let M = input[1]

var nums = readLine()!.split(separator: " ").map{Int($0)!}
nums.sort()

var arr = [String]()

func dfs(_ cnt: Int, _ str: String){
    
    if cnt == M {
        arr.append(str)
        return
    }
    var prev_num = -1
    for i in 0..<N {
        if prev_num != nums[i]{
            prev_num = nums[i]
            dfs(cnt+1,str+"\(nums[i]) ")
        }
        
    }
}
dfs(0, "")

for i in 0..<arr.count{
    print(arr[i])
}
