import Foundation

func solution(_ operations:[String]) -> [Int] {
    var operations = operations
    var queue = [Int]()
    
    for oper in operations {
        let cmd = oper[oper.index(oper.startIndex, offsetBy: 0)]
        let range = oper.index(oper.startIndex, offsetBy: 2) ..< oper.endIndex
        guard let num = Int(oper[range])
        else {
            print("error")
            break
        }
        if cmd == "I" {
            if queue.count == 0 {
                queue.append(num)
            }
            else {
                var flag = 0
                for i in 0..<queue.count {
                    if queue[i] < num {
                        continue
                    }
                    else {
                        queue.insert(num, at: i)
                        flag = 1
                        break
                    }
                }
                if flag == 0 {
                    queue.insert(num, at: queue.count)
                }
            }
        }
        else if cmd == "D" {
            if queue.count == 0 {
                continue
            }
            else {
                if num == 1 {
                    queue.removeLast()
                }
                else if num == -1 {
                    queue.removeFirst()
                }
            }
        }
    }
    
    var result = [Int]()
    if queue.count == 0 {
        result.append(0)
        result.append(0)
    }
    else {
        result.append(queue[queue.count-1])
        result.append(queue[0])
    }
    
    return result
}
