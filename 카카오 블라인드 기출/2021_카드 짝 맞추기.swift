/*
 https://koguri.tistory.com/81
 https://fomaios.tistory.com/entry/Swift-2021-KAKAO-BLIND-RECRUITMENT-%EC%B9%B4%EB%93%9C-%EC%A7%9D-%EB%A7%9E%EC%B6%94%EA%B8%B0
 */
import Foundation

func solution(_ board:[[Int]], _ r:Int, _ c:Int) -> Int {
    
    // 순서만들기
    var unsolvedNumSet = Set<Int>()
    for i in 0..<4 {
        for j in 0..<4 {
            if board[i][j] != 0 {
                unsolvedNumSet.insert(board[i][j])
            }
        }
    }
    let unsolvedNums = Array(unsolvedNumSet)
    var orders: [[Int]] = []
    var numsVisited = Array(repeating: false, count: unsolvedNums.count)
    func makeOrder(_ index: Int, _ order: [Int]) {
        if order.count == unsolvedNums.count {
            orders.append(order)
        }
        for i in 0..<unsolvedNums.count {
            if numsVisited[i] == false {
                numsVisited[i] = true
                var newOrder = order
                newOrder.append(unsolvedNums[i])
                makeOrder(i, newOrder)
                numsVisited[i] = false
            }
        }
    }
    for i in 0..<unsolvedNums.count {
        numsVisited[i] = true
        makeOrder(i, [unsolvedNums[i]])
        numsVisited[i] = false
    }
    
    // 순서별 카운트
    var results = [Int]()
    
    for order in orders {
        if order == [2,3,1] {
            
        }
        var r = r
        var c = c
        var count = 0
        var curBoard = board
        var enterCount = 0
        
        for num in order {
            var queue = [(Int, Int)]()

            if board[r][c] == num {
                count += 1
                enterCount += 1
                curBoard[r][c] = 0
            }

            checkCross(&queue, curBoard, r, c)
            
            var length = 0
            outer: while !queue.isEmpty && enterCount < 2 {
                let loopCount = queue.count
                for _ in 0..<loopCount {
                    let coor = queue.removeFirst()
                    let coorR = coor.0
                    let coorC = coor.1
                    if curBoard[coorR][coorC] == num {
                        length += 1
                        count += 1
                        enterCount += 1
                        curBoard[coorR][coorC] = 0
                        
                        queue.removeAll()
                        checkCross(&queue, curBoard, coorR, coorC)
                        r = coorR
                        c = coorC
                        break outer
                    }
                    else {
                        checkCross(&queue, curBoard, coorR, coorC)
                    }
                }
                
                length += 1
            }
            outer: while !queue.isEmpty && enterCount < 2 {
                let loopCount = queue.count
                for _ in 0..<loopCount {
                    let coor = queue.removeFirst()
                    let coorR = coor.0
                    let coorC = coor.1
                    if curBoard[coorR][coorC] == num {
                        length += 1
                        count += 1
                        enterCount += 1
                        curBoard[coorR][coorC] = 0
                        
                        queue.removeAll()
                        checkCross(&queue, curBoard, coorR, coorC)
                        r = coorR
                        c = coorC
                        break outer
                    }
                    else {
                        checkCross(&queue, curBoard, coorR, coorC)
                    }
                }
                length += 1
            }
            enterCount = 0
            count += length
        }
        results.append(count)
    }
    results.sort()
    return results.first!
}

func checkCross(_ queue: inout [(Int, Int)], _ curBoard: [[Int]], _ r: Int, _ c: Int) {
    
    if (0..<4).contains(r+1) {
        queue.append((r+1,c))
        if curBoard[r+1][c] == 0 && (0..<4).contains(r+2) {
            var curRow = r+2
            while (0..<4).contains(curRow) {
                if curBoard[curRow][c] != 0 {
                    break
                }
                curRow += 1
            }
            if curRow >= 4 {
                queue.append((3,c))
            }
            else {
                queue.append((curRow,c))
            }
        }
    }
    if (0..<4).contains(r-1) {
        queue.append((r-1,c))
        if curBoard[r-1][c] == 0 && (0..<4).contains(r-2){
            var curRow = r-2
            while (0..<4).contains(curRow) {
                if curBoard[curRow][c] != 0 {
                    break
                }
                curRow -= 1
            }
            if curRow < 0 {
                queue.append((0,c))
            }
            else {
                queue.append((curRow,c))
            }
        }
    }
    if (0..<4).contains(c+1) {
        queue.append((r,c+1))
        if curBoard[r][c+1] == 0 && (0..<4).contains(c+2){
            var curCol = c+2
            while (0..<4).contains(curCol) {
                if curBoard[r][curCol] != 0 {
                    break
                }
                curCol += 1
            }
            if curCol >= 4 {
                queue.append((r,3))
            }
            else {
                queue.append((r,curCol))
            }
        }
    }
    if (0..<4).contains(c-1) {
        queue.append((r,c-1))
        if curBoard[r][c-1] == 0 && (0..<4).contains(c-2){
            var curCol = c-2
            while (0..<4).contains(curCol) {
                if curBoard[r][curCol] != 0 {
                    break
                }
                curCol -= 1
            }
            if curCol < 0 {
                queue.append((r, 0))
            }
            else {
                queue.append((r,curCol))
            }
        }
    }
    
}
