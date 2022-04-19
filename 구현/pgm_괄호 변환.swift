// 주요 사용 개념 : 스택, 재귀
import Foundation

func solution(_ p:String) -> String {
    var str = p.map {String($0)}

    func isCorrect(_ str: [String]) -> Bool{
        var isCorrect = true
        var stack = [String]()

        for i in 0..<str.count {
            if str[i] == "(" {
                stack.append("(")
            }
            else {
                if stack.isEmpty {
                    isCorrect = false
                    break
                }
                else {
                    stack.removeLast()
                }
            }
        }
        if !stack.isEmpty {
            isCorrect = false
        }

        return isCorrect
    }

    func recursion(_ input: [String]) -> [String]{
        if input.isEmpty {
            return [String]()
        }
        else {
            var u = [String]()
            var v = [String]()

            var flag = 0

            if input[0] == "(" {
                flag += 1
                u.append("(")
            }
            else {
                flag -= 1
                u.append(")")
            }
            var index = 1
            while flag != 0 {
                if input[index] == "(" {
                    flag += 1
                    u.append("(")
                }
                else {
                    flag -= 1
                    u.append(")")
                }
                index += 1
            }
            if index < input.count{
                for i in index..<input.count {
                    v.append(input[i])
                }
            }
            
            if isCorrect(u) {
                u = u + recursion(v)
                return u
            }
            else {
                var tmpStr = ["("]
                tmpStr = tmpStr + recursion(v)
                tmpStr.append(")")
                u.removeLast()
                u.removeFirst()
                
                for i in 0..<u.count {
                    if u[i] == "(" {
                        tmpStr.append(")")
                    }
                    else {
                        tmpStr.append("(")
                    }
                    
                }
                return tmpStr
            }
        }
    }
    while !isCorrect(str) {
        str = recursion(str)
    }

    var result = ""
    for i in 0..<str.count {
        result += str[i]
    }
    return result
}
