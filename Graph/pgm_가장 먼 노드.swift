/*
 - 스위프트에서 reverse는 O(n), reversed는 O(1) !! (queue 만들어서 pop 연산 시)
 - 20000 * 20000 을 했을 때 400000000의 연산이 큼을 예상하고 matrix가 아닌 list로 접근할 생각 !!!!
 */

import Foundation

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var list = [[Int]](repeating: Array(), count: n+1)
    var check = [Int](repeating: 0,count: n+1 )
    var d = [Int](repeating: 0,count: n+1 )
    
    for e in edge {
        list[e[0]].append(e[1])
        list[e[1]].append(e[0])
    }
    
    var queue = [Int]()
    queue.append(1)
    check[1] = 1
    
    
    var max = -1;
    var cnt = 0;
    
    func bfs(){
        while !queue.isEmpty {
            queue = queue.reversed()
            let v = queue.popLast()!
            queue = queue.reversed()
            for i in 0..<list[v].count {
                if check[list[v][i]] == 0 {
                    queue.append(list[v][i])
                    d[list[v][i]] = d[v] + 1
                    check[list[v][i]] = 1
                }
            }
        }
    }
    
    bfs()
    for distance in d {
        if distance > max {
            max = distance
            cnt = 1
        }
        else if distance == max {
            cnt += 1
        }
    }
    return cnt
}


// matrix로 풀어서 시간초과

//import Foundation
//
//var n = 6
//var edge:[[Int]] = [[3, 6], [4, 3], [3, 2], [1, 3], [1, 2], [2, 4], [5, 2]]
//
//var maxtirx = [[Int]](repeating: Array(repeating: 0,count: n+1 ), count: n+1)
//var check = [Int](repeating: 0,count: n+1 )
//var d = [Int](repeating: 0,count: n+1 )
//
//for e in edge {
//    maxtirx[e[0]][e[1]] = 1
//    maxtirx[e[1]][e[0]] = 1
//}
//
//var queue = [Int]()
//queue.append(1)
//check[1] = 1
//
//
//var max = -1;
//var cnt = 0;
//
//func bfs(){
//    while !queue.isEmpty {
//        queue = queue.reversed()
//        let v = queue.popLast()!
//        queue = queue.reversed()
//        for i in 0..<check.count {
//            if check[i] == 0 && maxtirx[v][i] == 1 {
//                queue.append(i)
//                d[i] = d[v] + 1
//                check[i] = 1
//
//                if d[i] > max {
//                    max = d[i]
//                    cnt = 1
//                }
//                else if d[i] == max {
//                    cnt += 1
//                }
//
//            }
//        }
//    }
//}
//
//bfs()
//for distance in d {
//    if distance > max {
//        max = distance
//        cnt = 1
//    }
//    else if distance == max {
//        cnt += 1
//    }
//}
//return cnt

