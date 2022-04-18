import Foundation

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    
    var matrix = Array(repeating: Array(repeating: 0, count: columns+1), count: rows+1)
    
    var num = 1
    for i in 1...rows {
        for j in 1...columns {
            matrix[i][j] = num
            num += 1
        }
    }
    var answer = [Int]()
    var minNum = 10001
    for query in queries {
        
        var storeNum = -1
        var curRow = -1
        var curCol = -1
        
        //1
        curRow = query[0]
        curCol = query[1]
        storeNum = matrix[curRow][curCol]
        for i in query[1]...query[3]-1 {
            if storeNum < minNum {
                minNum = storeNum
            }
            let tmpNum = matrix[curRow][i+1]
            matrix[curRow][i+1] = storeNum
            storeNum = tmpNum
        }
        //2
        curRow = query[0]
        curCol = query[3]
        for i in query[0]...query[2]-1 {
            if storeNum < minNum {
                minNum = storeNum
            }
            let tmpNum = matrix[i+1][curCol]
            matrix[i+1][curCol] = storeNum
            storeNum = tmpNum
        }
        //3
        curRow = query[2]
        curCol = query[3]
        for i in (query[1]+1...query[3]).reversed() {
            if storeNum < minNum {
                minNum = storeNum
            }
            let tmpNum = matrix[curRow][i-1]
            matrix[curRow][i-1] = storeNum
            storeNum = tmpNum
        }
        //4
        curRow = query[2]
        curCol = query[1]
        for i in (query[0]+1...query[2]).reversed() {
            if storeNum < minNum {
                minNum = storeNum
            }
            let tmpNum = matrix[i-1][curCol]
            matrix[i-1][curCol] = storeNum
            storeNum = tmpNum
        }
        answer.append(minNum)
        minNum = 10001
    }
    return answer
}
