import Foundation
/*
 아래는 반복문으로 푼 풀이.
 그러나 재귀로 푸는게 정석
 
let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])

var arr = Array(repeating: 0, count: n+1)
for i in 0...n {
    arr[i] = i
}

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (type, a, b) = (input[0], input[1], input[2])
    if type == 0 {
        if a == b {
            continue
        }
        var bArr = [b]
        var p = arr[b]
        bArr.append(p)
        while arr[p] != p {
            p = arr[p]
            bArr.append(p)
        }
        bArr.forEach {
            arr[$0] = p
        }
        
        var aArr = [a]
        var c = a
        aArr.append(c)
        while arr[c] != c {
            c = arr[c]
            aArr.append(c)
        }
        aArr.forEach {
            arr[$0] = p
        }
    }
    else if type == 1 {
        if a == b {
            print("YES")
            continue
        }
        
        var p = arr[b]
        while arr[p] != p {
            p = arr[p]
        }
        
        var c = a
        while arr[c] != c {
            c = arr[c]
        }
        if p == c {
            print("YES")
        }
        else {
            print("NO")
        }
    }
}
*/

import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])

var parent = Array(repeating: 0, count: n+1)
for i in 0...n {
    parent[i] = i
}

func findParent(_ x: Int) -> Int {
    if x != parent[x] {
        parent[x] = findParent(parent[x])
    }
    return parent[x]
}

func union(_ a: Int, _ b: Int) {
    let aParent = findParent(a)
    let bParent = findParent(b)
    
    if aParent < bParent {
        parent[bParent] = aParent
    }
    else {
        parent[aParent] = bParent
    }
}

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (type, a, b) = (input[0], input[1], input[2])
    if type == 0 {
        if a == b {
            continue
        }
        union(a ,b)
    }
    else if type == 1 {
        if a == b {
            print("YES")
            continue
        }
        
        print(findParent(a) == findParent(b) ? "YES" : "NO")
    }
}
