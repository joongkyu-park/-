import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    
    var result = [Int]()
    
    for command in commands {
        var subArr = [Int]()
        for i in command[0]-1..<command[1] {
            subArr.append(array[i])
        }
        subArr.sort()
        result.append(subArr[command[2]-1])
    }
    return result
}
