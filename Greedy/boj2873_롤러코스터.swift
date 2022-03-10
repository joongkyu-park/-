// https://suhwanc.tistory.com/23
// https://chasingstar.tistory.com/24

import Foundation

let rc = readLine()!.split(separator: " ").map{Int(String($0))!}
let r = rc[0]
let c = rc[1]

var map = Array(repeating: Array(repeating: 0, count: c), count: r)
for i in 0..<r {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    for j in 0..<c{
        map[i][j] = input[j]
    }
}
var route = ""

if r%2 == 0 && c%2 == 0 {
    var min = 1000
    var minR = 0
    var minC = 0
    
    for i in 0..<r{
        for j in 0..<c{
            if ((i+j)%2 == 0) {continue}
            if map[i][j] < min {
                min = map[i][j]
                minR = i
                minC = j
            }
        }
    }
    
    var leftrightFlag = true // true : have to go "right", false : have to go "left"
    for i in 0..<r/2{

        var curR = i*2
        var curC = 0
        
        if i == minR/2 {
            
            var updownFlag = false // true : have to go "up", false : have to go "down"
            
            if leftrightFlag{
                while !(curR == (i*2+1) && curC == c-1){
                    if updownFlag {
                        if (curR-1 == minR) && (curC == minC) {
                            route += "R"
                            curC += 1
                        }
                        else {
                            route += "U"
                            curR -= 1
                            
                            updownFlag = false
                            
                            if curC+1 != c{
                                route += "R"
                                curC += 1
                            }
                        }
                    }
                    else {
                        if (curR+1 == minR) && (curC == minC) {
                            route += "R"
                            curC += 1
                        }
                        else {
                            route += "D"
                            curR += 1
                            
                            updownFlag = true
                            
                            if curC+1 != c{
                                route += "R"
                                curC += 1
                            }
                        }
                    }
                }
                leftrightFlag = false
            }
            else{
                while !(curR == (i*2+1) && curC == 0){
                    if updownFlag {
                        if (curR-1 == minR) && (curC == minC) {
                            route += "L"
                            curC -= 1
                        }
                        else {
                            route += "U"
                            curR -= 1
                            
                            updownFlag = false
                            
                            if curC-1 != -1{
                                route += "L"
                                curC -= 1
                            }
                        }
                    }
                    else {
                        if (curR+1 == minR) && (curC == minC) {
                            route += "L"
                            curC -= 1
                        }
                        else {
                            route += "D"
                            curR += 1
                            
                            updownFlag = true
                            
                            if curC-1 != -1{
                                route += "L"
                                curC -= 1
                            }
                        }
                    }
                }
                leftrightFlag = true
            }

        }
        else {
            if leftrightFlag {
                for _ in 0..<c-1{
                    route += "R"
                }
                route += "D"
                curR += 1
                for _ in 0..<c-1{
                    route += "L"
                }
            }
            else {
                for _ in 0..<c-1{
                    route += "L"
                }
                route += "D"
                curR += 1
                for _ in 0..<c-1{
                    route += "R"
                }
            }
        }
        if curR != r-1 {
            route += "D"
        }
    }
}
else {
    if r%2 != 0 {
        for i in 0..<r {
            for _ in 0..<c-1{
                if i%2 == 0 {
                    route += "R"
                }
                else {
                    route += "L"
                }
            }
            if i != r-1{
                route += "D"
            }
        }
    }
    else {
        for i in 0..<c {
            for _ in 0..<r-1{
                if i%2 == 0 {
                    route += "D"
                }
                else {
                    route += "U"
                }
            }
            if i != c-1{
                route += "R"
            }
        }
    }
}

print(route)

