import Foundation

func solution(_ expression:String) -> Int64 {
    var answer: Int64 = 0
    
    var numbers = [Int64]()
    var operaters = [Int]() //0 = +, 1 = -, 2 = *
    let exrpressionArr = Array(expression).map{ String($0) }
    
    var tmpStr = ""
    for i in 0..<exrpressionArr.count {
        if exrpressionArr[i] == "+"
            || exrpressionArr[i] == "-"
            || exrpressionArr[i] == "*" {
            numbers.append(Int64(tmpStr)!)
            if exrpressionArr[i] == "+" {
                operaters.append(0)
            }
            else if exrpressionArr[i] == "-" {
                operaters.append(1)
            }
            else if exrpressionArr[i] == "*" {
                operaters.append(2)
            }
            tmpStr = ""
        }
        else {
            tmpStr += exrpressionArr[i]
        }
    }
    numbers.append(Int64(tmpStr)!)
    
    func calculate(_ nums: [Int64], _ opers: [Int], _ oper1: Int, _ oper2: Int,_ oper3: Int) {
        var resultNums1 = [Int64]()
        var resultOpers1 = [Int]()
        
        resultNums1.append(nums[0])
        for i in 0..<opers.count {
            if opers[i] == oper1 {
                if oper1 == 0 {
                    resultNums1.append(resultNums1.removeLast() + nums[i+1])
                }
                else if oper1 == 1 {
                    resultNums1.append(resultNums1.removeLast() - nums[i+1])
                }
                else if oper1 == 2 {
                    resultNums1.append(resultNums1.removeLast() * nums[i+1])
                }
            }
            else {
                resultNums1.append(nums[i+1])
                resultOpers1.append(opers[i])
            }
        }
        
        var resultNums2 = [Int64]()
        var resultOpers2 = [Int]()
        
        resultNums2.append(resultNums1[0])
        for i in 0..<resultOpers1.count {
            if resultOpers1[i] == oper2 {
                if oper2 == 0 {
                    resultNums2.append(resultNums2.removeLast() + resultNums1[i+1])
                }
                else if oper2 == 1 {
                    resultNums2.append(resultNums2.removeLast() - resultNums1[i+1])
                }
                else if oper2 == 2 {
                    resultNums2.append(resultNums2.removeLast() * resultNums1[i+1])
                }
            }
            else {
                resultNums2.append(resultNums1[i+1])
                resultOpers2.append(resultOpers1[i])
            }
        }
        
        var resultNums3 = [Int64]()
        
        
        resultNums3.append(resultNums2[0])
        for i in 0..<resultOpers2.count {
            
            if oper3 == 0 {
                resultNums3.append(resultNums3.removeLast() + resultNums2[i+1])
            }
            else if oper3 == 1 {
                resultNums3.append(resultNums3.removeLast() - resultNums2[i+1])
            }
            else if oper3 == 2 {
                resultNums3.append(resultNums3.removeLast() * resultNums2[i+1])
            }
        }
        
        if abs(Double(resultNums3[0])) > Double(answer) {
            answer = Int64(abs(Double(resultNums3[0])))
        }
    }
    for i in 0..<3 {
        for j in 0..<3 {
            for k in 0..<3 {
                if i != j && j != k && i != k {
                    
                    calculate(numbers, operaters, i, j, k)
                }
            }
        }
    }
    
    return answer
}
