import Foundation

func solution(_ s:String) -> Int {
    var answer = 0
    var arr = Array(s).map{String($0)}
    
    func check() -> Int{
        var stack = [String]()
        
        for i in 0..<arr.count {
            if arr[i] == "(" || arr[i] == "{" || arr[i] == "[" {
                stack.append(arr[i])
            }
            else {
                if stack.isEmpty {
                    return 0
                }
                
                if arr[i] == ")" {
                    if stack.last! == "("{
                        stack.removeLast()
                    }
                    else {
                        return 0
                    }
                }
                else if arr[i] == "}" {
                    if stack.last! == "{"{
                        stack.removeLast()
                    }
                    else {
                        return 0
                    }
                }
                else if arr[i] == "]" {
                    if stack.last! == "["{
                        stack.removeLast()
                    }
                    else {
                        return 0
                    }
                }
            }
        }
        if stack.isEmpty {
            return 1
        }
        return 0
    }
    
    answer += check()
    for _ in 0..<arr.count-1 {
        
        let move = arr.removeFirst()
        arr.append(move)
        answer += check()
    }
    return answer
}
