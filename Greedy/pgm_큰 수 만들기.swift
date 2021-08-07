import Foundation

/*
 1.
 String은 인덱스 접근이 불편하니까
 ( ex) let currentNum = Int(String(number[number.index(number.startIndex, offsetBy: index)])) )
 var numArr: [Character] = number.map { $0 }
 이렇게 맨처음에 map으로 나눠준다음에 시작...!
    => 이거 때문에 시간초과 통과했다..! map말고도 filter, reduce같은 배열다루는 고차함수 공부
 
 2.
 위처럼 바꿨는데도 시간초과 이슈 1-2개 존재..
 if(currentMaxNum == 9) {break}
 이 라인 추가했더니 완전해결..어이없지만 교훈
 */

func solution(_ number:String, _ k:Int) -> String {
    var numArr: [Character] = number.map { $0 }

    var result = [String]()
    var count = k

    var index = 0
    var nextStartIndex = 0
    var currentMaxNum = -1

    while count < numArr.count {
        
        index = nextStartIndex
        currentMaxNum = -1
        
        while index <= count {
            let currentNum = Int(String(numArr[index]))
            
            if currentNum! > currentMaxNum {
                currentMaxNum = currentNum!
                nextStartIndex = index + 1
            }
            index += 1
            if(currentMaxNum == 9) {break}
        }
        result.append(String(currentMaxNum))
        count += 1
    }

    var resultStr = ""

    for i in result {
        resultStr += i
    }
    return resultStr
}

