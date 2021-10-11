import Foundation

let N = Int(readLine()!)!

var nums = readLine()!.split(separator: " ").map{Int($0)!}

var border = -1
var index = -1
for i in 0..<nums.count-1 {
    if nums[i] > nums[i+1] {
        border = nums[i]
        index = i
    }
}
if border == -1 {
    print(border)
}
else{
    var tmp = -1
    var tmpIndex = -1
    
    for i in index+1..<nums.count {
        if nums[i] < border && tmp < nums[i]{
            tmp = nums[i]
            tmpIndex = i
        }
    }
    nums[index] = tmp
    nums[tmpIndex] = border
    
    var part1 = [Int]()
    var part2 = [Int]()
    for i in 0...index {
        part1.append(nums[i])
    }
    for i in index+1..<nums.count {
        part2.append(nums[i])
    }
    part2.sort()
    part2.reverse()
    
    var result = part1 + part2
    
    for i in 0..<result.count {
        print(result[i], terminator: " ")
    }
    print()
}
