/*
숫자카드1 보다 훨씬 코드 간결하게 만듬.
 */

let n = Int(readLine()!)!
var cards = readLine()!.split(separator: " ").map{Int(String($0))!}

let m = Int(readLine()!)!
let compares = readLine()!.split(separator: " ").map{Int(String($0))!}

var cardsIdx = 0
var compareIdx = 0

var dic = [Int:Int]()

while cardsIdx < cards.count {
    if dic[cards[cardsIdx]] == nil {
        dic[cards[cardsIdx]] = 1
    }
    else {
        dic[cards[cardsIdx]]! += 1
    }
    cardsIdx += 1
}
var answer = ""

while compareIdx < compares.count {
    if dic[compares[compareIdx]] == nil {
        answer += "0 "
    }
    else {
        answer += "\(dic[compares[compareIdx]]!) "
    }
    compareIdx += 1
}
print(answer)

