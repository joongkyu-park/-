import Foundation

let n = Int(readLine()!)!
var graph = Array(repeating: [Int](), count: Int(pow(Double(n),2))+1)
var order = [Int](arrayLiteral: -1)
var map = Array(repeating: Array(repeating: -1, count: n+1), count: n+1)
let dx = [1,-1,0,0]
let dy = [0,0,1,-1]

for _ in 0..<Int(pow(Double(n),2)) {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let v = input[0]
    order.append(v)
    for i in 1...4 {
        graph[v].append(input[i])
    }
}

for i in 1...Int(pow(Double(n),2)) {
    let v = order[i]
    if i == 1 {
        map[2][2] = v
        continue
    }
    var blankMaxCnt = 0
    var likeMaxCnt = 0
    var row = -1
    var col = -1
    
    for r in (1...n).reversed() {
        for c in (1...n).reversed() {
            if map[r][c] != -1 {
                continue
            }
            if row == -1 {
                row = r
                col = c
            }
            var blankCnt = 0
            var likeCnt = 0
            for d in 0..<4 {
                if (1...n).contains(r+dx[d]) && (1...n).contains(c+dy[d]) {
                    if map[r+dx[d]][c+dy[d]] == -1 {
                        blankCnt += 1
                    }
                    else {
                        if graph[v].contains(map[r+dx[d]][c+dy[d]]) {
                            likeCnt += 1
                        }
                    }
                }
            }
            if likeCnt > likeMaxCnt {
                row = r
                col = c
                blankMaxCnt = blankCnt
                likeMaxCnt = likeCnt
            }
            else if likeCnt == likeMaxCnt {
                if blankCnt > blankMaxCnt {
                    row = r
                    col = c
                    blankMaxCnt = blankCnt
                    likeMaxCnt = likeCnt
                }
                else if blankCnt == blankMaxCnt {
                    row = r
                    col = c
                    blankMaxCnt = blankCnt
                    likeMaxCnt = likeCnt
                }
            }
        }
    }
    map[row][col] = v
}

var result = 0

for r in 1...n {
    for c in 1...n {
        var cnt = 0
        let v = map[r][c]
        for d in 0..<4 {
            if (1...n).contains(r+dx[d]) && (1...n).contains(c+dy[d]) {
                if graph[v].contains(map[r+dx[d]][c+dy[d]]) {
                    cnt += 1
                }
            }
        }
        if cnt == 1 {
            result += 1
        }
        else if cnt == 2 {
            result += 10
        }
        else if cnt == 3 {
            result += 100
        }
        else if cnt == 4 {
            result += 1000
        }
    }
}

print(result)
