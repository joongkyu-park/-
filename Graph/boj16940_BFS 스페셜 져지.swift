// 출처 : https://www.acmicpc.net/user/golddol2003
// parent배열의 활용이 시간초과를 줄이는데에 관건. (원래는 배열의 contains 함수를 이용해서 하나하나 찾으려다보니까 시간초과)

import Foundation

let n = Int(readLine()!)!

var edges: [[Int]] = Array(repeating: [], count: n)
var parent = Array(repeating: 0, count: n)

for _ in 0..<n-1{
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    edges[input[0]-1].append(input[1]-1)
    edges[input[1]-1].append(input[0]-1)
}
let order = readLine()!.split(separator: " ").map{Int(String($0))!-1}


var q = [Int]()
var check = Array(repeating: false, count: n)
q.append(0)
check[0] = true

var index = 1
var ans = [Int]()

func bfs() {
    for i in 0..<n{
        if q.isEmpty{
            print(0)
            return
        }
        let x = q.removeFirst()
        if x != order[i]{
            print(0)
            return
        }
        var cnt = 0
        for y in edges[x]{
            if check[y] == false{
                parent[y] = x
                cnt += 1
            }
        }
        for j in 0..<cnt{
            if parent[order[index+j]] != x{
                print(0)
                return
            }
            q.append(order[index+j])
            check[order[index+j]] = true
        }
        index += cnt
    }
    print(1)
    return
}

bfs()
