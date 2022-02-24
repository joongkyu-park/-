import Foundation

let n = Int(readLine()!)!
let input = Array(readLine()!).split(separator: " ").map{Int(String($0))!}

var maxSum = 0
func dfs(_ w: Int, _ arr: [Int]){
    if arr.count == 2{
        if w > maxSum {
            maxSum = w
        }
        return
    }
    
    for i in 1..<arr.count-1{
        var curArr = arr
        curArr.remove(at: i)
        dfs(w + arr[i-1]*arr[i+1], curArr)
    }
}

for i in 1..<input.count-1{
    var curArr = input
    curArr.remove(at: i)
    dfs(input[i-1]*input[i+1], curArr)
}

print(maxSum)
