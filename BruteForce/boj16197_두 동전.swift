import Foundation

let nm = Array(readLine()!).split(separator: " ").map{Int(String($0))!}
let n = nm[0]
let m = nm[1]

//0: 빈칸, 1:벽
var board = Array(repeating: Array(repeating: -1, count: m), count: n)

var coin1 = (-1,-1)
var coin2 = (-1,-1)

let move = [(1,0),(0,1),(-1,0),(0,-1)]
var visitied1 = Array(repeating: Array(repeating: false, count: m), count: n)
var visitied2 = Array(repeating: Array(repeating: false, count: m), count: n)

for i in 0..<n{
    let input = Array(readLine()!).map{String($0)}
    for j in 0..<m{
        if input[j] == "."{
            board[i][j] = 0
        }
        else if input[j] == "#"{
            board[i][j] = 1
        }
        else {
            board[i][j] = 0
            if coin1.0 == -1 {
                coin1.0 = i
                coin1.1 = j
            }
            else {
                coin2.0 = i
                coin2.1 = j
            }
        }
    }
}

var minCnt = 11

func dfs(_ cnt: Int, _ coin1X: Int, _ coin1Y: Int, _ coin2X: Int, _ coin2Y: Int){
    if cnt > 10 {
        return
    }

    let curCoin1X = coin1X
    let curCoin1Y = coin1Y
    let curCoin2X = coin2X
    let curCoin2Y = coin2Y

    for i in 0..<4{
        var nextCoin1X = curCoin1X+move[i].0
        var nextCoin1Y = curCoin1Y+move[i].1
        var nextCoin2X = curCoin2X+move[i].0
        var nextCoin2Y = curCoin2Y+move[i].1

        if (0..<n).contains(nextCoin1X)
            && (0..<m).contains(nextCoin1Y) {
            if board[nextCoin1X][nextCoin1Y] == 1 {
                nextCoin1X = curCoin1X
                nextCoin1Y = curCoin1Y
            }
        }
        if (0..<n).contains(nextCoin2X)
            && (0..<m).contains(nextCoin2Y) {
            if board[nextCoin2X][nextCoin2Y] == 1 {
                nextCoin2X = curCoin2X
                nextCoin2Y = curCoin2Y
            }
        }
        check(cnt+1, nextCoin1X, nextCoin1Y, nextCoin2X, nextCoin2Y)

        if (0..<n).contains(nextCoin1X)
            && (0..<m).contains(nextCoin1Y)
            && (0..<n).contains(nextCoin2X)
            && (0..<m).contains(nextCoin2Y) {

            if !(nextCoin1X == nextCoin2X && nextCoin1Y == nextCoin2Y)
                && (visitied1[nextCoin1X][nextCoin1Y] == false || visitied2[nextCoin2X][nextCoin2Y] == false){
                visitied1[nextCoin1X][nextCoin1Y] = true
                visitied2[nextCoin2X][nextCoin2Y] = true
                dfs(cnt+1, nextCoin1X, nextCoin1Y, nextCoin2X, nextCoin2Y)
                visitied1[nextCoin1X][nextCoin1Y] = false
                visitied2[nextCoin2X][nextCoin2Y] = false
            }
        }

    }
}

visitied1[coin1.0][coin1.1] = true
visitied2[coin2.0][coin2.1] = true
let curCoin1X = coin1.0
let curCoin1Y = coin1.1
let curCoin2X = coin2.0
let curCoin2Y = coin2.1

for i in 0..<4{
    var nextCoin1X = curCoin1X+move[i].0
    var nextCoin1Y = curCoin1Y+move[i].1
    var nextCoin2X = curCoin2X+move[i].0
    var nextCoin2Y = curCoin2Y+move[i].1

    if (0..<n).contains(nextCoin1X)
        && (0..<m).contains(nextCoin1Y) {
        if board[nextCoin1X][nextCoin1Y] == 1 {
            nextCoin1X = curCoin1X
            nextCoin1Y = curCoin1Y
        }
    }
    if (0..<n).contains(nextCoin2X)
        && (0..<m).contains(nextCoin2Y) {
        if board[nextCoin2X][nextCoin2Y] == 1 {
            nextCoin2X = curCoin2X
            nextCoin2Y = curCoin2Y
        }
    }
    check(1, nextCoin1X, nextCoin1Y, nextCoin2X, nextCoin2Y)

    if (0..<n).contains(nextCoin1X)
        && (0..<m).contains(nextCoin1Y)
        && (0..<n).contains(nextCoin2X)
        && (0..<m).contains(nextCoin2Y) {

        if !(nextCoin1X == nextCoin2X && nextCoin1Y == nextCoin2Y)
            && (visitied1[nextCoin1X][nextCoin1Y] == false || visitied2[nextCoin2X][nextCoin2Y] == false){
            visitied1[nextCoin1X][nextCoin1Y] = true
            visitied2[nextCoin2X][nextCoin2Y] = true
            dfs(1, nextCoin1X, nextCoin1Y, nextCoin2X, nextCoin2Y)
            visitied1[nextCoin1X][nextCoin1Y] = false
            visitied2[nextCoin2X][nextCoin2Y] = false
        }
    }
}

func check(_ cnt: Int, _ coin1X: Int, _ coin1Y: Int, _ coin2X: Int, _ coin2Y: Int){
    // coin1 낙
    if !(0..<n).contains(coin1X) || !(0..<m).contains(coin1Y){
        if (0..<n).contains(coin2X) && (0..<m).contains(coin2Y){ // coin2 낙x
            if cnt < minCnt{
                minCnt = cnt
            }
            return
        }
    }
    // coin1 낙x
    else {
        if !(0..<n).contains(coin2X) || !(0..<m).contains(coin2Y){ // coin2 낙
            if cnt < minCnt{
                minCnt = cnt
            }
            return
        }
    }
}

if minCnt == 11{
    print(-1)
}
else{
    print(minCnt)
}
