/*
 80프로에서 틀렸다고 나오는데 이유 모르겠음
 https://gooddaytocode.blogspot.com/2017/05/north-eastern-european-regional-contest.html
 https://neerc.ifmo.ru/archive/2005.html
 */
import Foundation

let n = Int(readLine()!)!
var mtrx = [[Int]](repeating: Array(repeating: 0, count: 4), count: n)
for i in 0..<n {
    let input = readLine()!.split(separator: ".").map{Int($0)!}
    
    for j in 0..<4{
        mtrx[i][j] = input[j]
    }
}

var network = [0,0,0,0]
var stop = false

var chunk = 0
var index = 0

var exception = false

for j in 0..<4{
    for k in (0..<8).reversed(){
        var flag = 0
        for i in 0..<n {
            if i == 0{
                flag = mtrx[i][j] & 1<<k
            }
            else {
                var phase = mtrx[i][j] & 1<<k
                
                if flag != phase{

                    var halt = false
                    for x in 0...j{
                        for y in (0..<8).reversed(){
                            if x == j && y == k{
                                halt = true
                                break
                            }
                            else{
                                network[x] += mtrx[0][x] & 1<<y
                            }
                        }
                        if halt{
                            break
                        }
                    }
                    
                    if k == 7 {
                        if j == 0 {
                            exception = true
                        }
                        else {
                            chunk = j-1
                            index = 0
                        }
                    }
                    else{
                        chunk = j
                        index = k+1
                    }
                    
                    stop = true
                    break
                }
            }
        }
        if stop {
            break
        }
    }
    if stop {
        break
    }
}
var mask = [0,0,0,0]

if exception{
    
}
else{
    for i in 0...chunk {
        var x = 0
        if i == chunk{
            x = index
        }
        else{
            x = 0
        }
        for j in (x...7).reversed(){
            mask[i] += 1<<j
        }
    }
}


for i in 0..<4{
    if i == 3 {
        print(network[i])
    }
    else{
        print(network[i], terminator:".")
    }
}
for i in 0..<4{
    if i == 3 {
        print(mask[i])
    }
    else{
        print(mask[i], terminator:".")
    }
}
