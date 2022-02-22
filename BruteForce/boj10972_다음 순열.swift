/*
 참고 https://kwanghyuk.tistory.com/25
 https://amunre21.github.io/boj/1-10972/
 https://velog.io/@sun02/Swift-%EB%B0%B1%EC%A4%80-10972-%EB%8B%A4%EC%9D%8C-%EC%88%9C%EC%97%B4
 */
import Foundation

let N = Int(readLine()!)!

var nums = readLine()!.split(separator: " ").map{Int($0)!}

var border = -1
var index = -1
for i in 0..<nums.count-1 {
    if nums[i] < nums[i+1] {
        border = nums[i]
        index = i
    }
}
if border == -1 {
    print(border)
}
else{
    var tmp = 10001
    var tmpIndex = -1
    
    for i in index+1..<nums.count {
        if nums[i] > border && tmp > nums[i]{
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
    
    var result = part1 + part2
    
    for i in 0..<result.count {
        print(result[i], terminator: " ")
    }
    print()
}

