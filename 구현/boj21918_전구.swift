import Foundation

let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nm[0]
let m = nm[1]

var bolbs = readLine()!.split(separator: " ").map{Int(String($0))!}
for _ in 0..<m {
    let cmd = readLine()!.split(separator: " ").map{Int(String($0))!}
    if cmd[0] == 1 {
        let i = cmd[1]-1
        let x = cmd[2]
        
        bolbs[i] = x
    }
    else if cmd[0] == 2 {
        let l = cmd[1]-1
        let r = cmd[2]-1
        
        for i in l...r {
            bolbs[i] = abs(bolbs[i]-1)
        }
    }
    else if cmd[0] == 3 {
        let l = cmd[1]-1
        let r = cmd[2]-1
        
        for i in l...r {
            bolbs[i] = 0
        }
    }
    else if cmd[0] == 4 {
        let l = cmd[1]-1
        let r = cmd[2]-1
        
        for i in l...r {
            bolbs[i] = 1
        }
    }
}


for i in 0..<n {
    print(bolbs[i], terminator: " ")
}
print("")
