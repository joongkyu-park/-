import Foundation
/*
논리는 맞았으나!! 시간초과 why?
 -> matrix로 그래프의 관계를 표현했기 때문에 전체를 탐색해야해서 너무 시간 오래걸림 (1 ≤ M ≤ 2000)
    -> 어차피 연결되어있는 애(친구관계)만 보면 되니까 array-list로 그래프의 관계 표현하자!!

let m: Int
let n: Int

let input = readLine()!.split(separator: " ").map{String($0)}
m = Int(input[0])!
n = Int(input[1])!

var mtrx = Array(repeating: Array(repeating: 0, count: m), count: m)

for _ in 0..<n {
    let relationship = readLine()!.split(separator: " ").map{String($0)}
    let first = Int(relationship[0])!
    let second = Int(relationship[1])!
    
    mtrx[first][second] = 1
    mtrx[second][first] = 1
}


var visited = Array(repeating: 0, count: m)
var flag = 0

func dfs(_ node: Int, _ sum: Int){
    if flag == 1 {
        return
    }
    if sum == 5{
        flag = 1
        return
    }
    for i in 0..<m {
        if visited[i] == 0 && mtrx[node][i] == 1{
            visited[i] = 1
            dfs(i, sum+1)
            visited[i] = 0
            
            if flag == 1{
                return
            }
        }
    }
}

for i in 0..<m {
    for j in 0..<m {
        visited[j] = 0
    }
    flag = 0
    
    visited[i] = 1
    dfs(i, 1)
    
    if flag == 1{
        break
    }
}

print(flag)
*/

let m: Int
let n: Int

let input = readLine()!.split(separator: " ").map{String($0)}
m = Int(input[0])!
n = Int(input[1])!

var arrList = Array(repeating: Array<Int>(), count: m)

for _ in 0..<n {
    let relationship = readLine()!.split(separator: " ").map{String($0)}
    let first = Int(relationship[0])!
    let second = Int(relationship[1])!
    
    arrList[first].append(second)
    arrList[second].append(first)
}

var visited = Array(repeating: 0, count: m)
var flag = 0

func dfs(_ node: Int, _ sum: Int){
    if flag == 1 {
        return
    }
    if sum == 5{
        flag = 1
        return
    }
    for i in 0..<arrList[node].count {
        let next = arrList[node][i]
        if visited[next] == 0 {
            visited[next] = 1
            dfs(next, sum+1)
            visited[next] = 0
            
            if flag == 1{
                return
            }
        }
    }
}

for i in 0..<m {
    for j in 0..<m {
        visited[j] = 0
    }
    flag = 0
    
    visited[i] = 1
    dfs(i, 1)
    
    if flag == 1{
        break
    }
}

print(flag)
