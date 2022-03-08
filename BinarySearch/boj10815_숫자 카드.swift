/*
 출제의도는 이분탐색 문제 -> m * O(logm)
 내 풀이는 O(n+m) + m * O(1) (해쉬는 인덱스로 접근하기때문에 O(1) )
 */

let n = Int(readLine()!)!
var cards = readLine()!.split(separator: " ").map{Int(String($0))!}

let m = Int(readLine()!)!
let compares = readLine()!.split(separator: " ").map{Int(String($0))!}
let sortedCompares = compares.sorted()

cards.sort()

var cardsIdx = 0
var compareIdx = 0

var dic = [Int:Int]()

while cardsIdx < cards.count && compareIdx < sortedCompares.count{
    if cards[cardsIdx] > sortedCompares[compareIdx] {
        dic[sortedCompares[compareIdx]] = 0
        compareIdx += 1
    }
    else if cards[cardsIdx] < sortedCompares[compareIdx] {
        cardsIdx += 1
    }
    else {
        dic[sortedCompares[compareIdx]] = 1
        cardsIdx += 1
        compareIdx += 1
    }
}

while compareIdx < sortedCompares.count{
    dic[sortedCompares[compareIdx]] = 0
    compareIdx += 1
}

for i in 0..<compares.count{
    print(dic[compares[i]]!,terminator: " ")
}
print()
