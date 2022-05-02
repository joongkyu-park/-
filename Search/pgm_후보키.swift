import Foundation

func solution(_ relation:[[String]]) -> Int {
    let totalCnt = relation.count
    let colNum = relation[0].count
    var candidateKeys = [Set<Int>]()
    var answer = 0
    
    func getCandidateKey(_ index: Int, _ cadidateIndice: [Int], _ maxCnt: Int){
        if cadidateIndice.count == maxCnt {

            var set = Set<[String]>()
            for i in 0..<totalCnt {
                var keys = [String]()
                for index in cadidateIndice {
                    keys.append(relation[i][index])
                }
                set.insert(keys)
            }
            let curCandidatekey = Set(cadidateIndice)
            var flag = true
            if set.count == totalCnt {
                for cdkey in candidateKeys {
                    if cdkey.intersection(curCandidatekey) == curCandidatekey
                    || cdkey.intersection(curCandidatekey) == cdkey{
                        flag = false
                        break
                    }
                }
                if flag {
                candidateKeys.append(curCandidatekey)
                answer += 1
                }
            }
            
            return
        }
        
        if index+1 < colNum {
            for i in index+1..<colNum {
                var curCadidateIndice = cadidateIndice
                curCadidateIndice.append(i)
                getCandidateKey(i, curCadidateIndice, maxCnt)
            }
        }
    }
    
    for keyCnt in 1...colNum {

        for i in 0..<colNum {
            getCandidateKey(i, [i], keyCnt)
        }
        
    }
    return answer
}
