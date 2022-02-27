// https://mizzo-dev.tistory.com/entry/baekjoon1080
let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nm[0]
let m = nm[1]

var a = [[Int]]()
var b = [[Int]]()
var c = [[Int]]()
for _ in 0..<n{
    let input = Array(readLine()!).map{Int(String($0))!}
    a.append(input)
}
for _ in 0..<n{
    let input = Array(readLine()!).map{Int(String($0))!}
    b.append(input)
}

var cnt = 0

if n < 3 || m < 3 {
    if a==b{
        print(0)
    }
    else{
        print(-1)
    }
}
else {
    for i in 0..<n{
        var arr = [Int]()
        for j in 0..<m {
            arr.append(abs(a[i][j]-b[i][j]))
        }
        c.append(arr)
    }
    
    var flag = false
    
    outer: for i in 0..<n-2{
        for j in 0..<m-2{
            if c[i][j] == 1{
                for x in i...i+2{
                    for y in j...j+2{
                        c[x][y] = abs(c[x][y]-1)
                    }
                }
                cnt += 1
            }
            if j == m-3{
                
                for k in 0..<m-1{
                    if c[i][k] != c[i][k+1]{
                        flag = true
                        break
                    }
                }
            }
            if flag {
                break outer
            }
        }
    }
    if flag{
        print(-1)
    }
    else{
        var sum = 0
        for i in 0..<n{
            for j in 0..<m{
                sum += c[i][j]
            }
        }
        if sum > 0{
            print(-1)
        }
        else{
            print(cnt)
        }
    }
}
