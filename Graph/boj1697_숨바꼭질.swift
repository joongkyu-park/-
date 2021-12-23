import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}

let s = input[0] //수빈
let d = input[1] //동생

var visited = Array(repeating: 0, count: 100001)
var cnt = 0

var q = [Int]()
q.append(s)
visited[s] = 1

if s == d {
    print(0)
}
else if s>d{
    print(s-d)
}
else{
    outer: while !q.isEmpty{
        
        var size = q.count
        var curQ = [Int]()
        
        for _ in 0..<size{
            var cur = q.removeFirst()
            
            if d != cur-1
                && d != cur+1
                && d != cur*2
            {
                if (0...100000).contains(cur-1) && visited[cur-1] == 0{
                    curQ.append(cur-1)
                    visited[cur-1] = 1
                }
                if (0...100000).contains(cur+1) && visited[cur+1] == 0{
                    curQ.append(cur+1)
                    visited[cur+1] = 1
                }
                if (0...100000).contains(cur*2) && visited[cur*2] == 0{
                    curQ.append(cur*2)
                    visited[cur*2] = 1
                }
            }
            else {
                cnt += 1
                break outer
            }
            
        }
        
        q = curQ
        cnt += 1
    }
    
    print(cnt)
}
