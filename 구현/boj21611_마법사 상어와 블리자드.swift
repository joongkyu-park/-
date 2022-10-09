import Foundation

let nm = readLine()!.split(separator: " ").map{ Int(String($0))! }
let n = nm[0]
let m = nm[1]
var traversalAmount = [Int]()
for i in 1...(n-1) {
    if i == n-1 {
        for _ in 0..<3 {
            traversalAmount.append(i)
        }
    }
    else {
        for _ in 0..<2 {
            traversalAmount.append(i)
        }
    }
}
let originR = (n-1)/2
let originC = (n-1)/2
var map = Array(repeating: Array(repeating: 0, count: n), count: n)
for r in 0..<n {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    for c in 0..<n{
        map[r][c] = input[c]
    }
}
var skills = [(Int, Int)]()
for _ in 0..<m {
    let ds = readLine()!.split(separator: " ").map{ Int(String($0))! }
    skills.append((ds[0], ds[1]))
}

var numOneBeads = 0
var numTwoBeads = 0
var numThreeBeads = 0

// 1.마법
for skill in skills {
    let d = skill.0
    let s = skill.1
    
    if d == 1 {
        for i in 1...s {
            map[originR-i][originC] = 0
        }
    }
    else if d == 2 {
        for i in 1...s {
            map[originR+i][originC] = 0
        }
    }
    else if d == 3 {
        for i in 1...s {
            map[originR][originC-i] = 0
        }
    }
    else if d == 4 {
        for i in 1...s {
            map[originR][originC+i] = 0
        }
    }
    map = removeBlanks(map)
    // 2.폭발
    while explosion() {
        map = removeBlanks(map)
    }
    // 3.변화
    map = transition()
}

print(numOneBeads + numTwoBeads*2 + numThreeBeads*3)

// 함수

// 빈칸 당기기
func removeBlanks(_ map: [[Int]]) -> [[Int]]{
    var map = map
    var blanks = [(Int, Int)]()
    
    let dr = [0,1,0,-1]
    let dc = [-1,0,1,0]
    var r = originR
    var c = originC
    
    var dIndex = 0
    for tIndex in 0..<traversalAmount.count {
        let amount = traversalAmount[tIndex]
        for _ in 0..<amount {
            r = r + dr[dIndex]
            c = c + dc[dIndex]
            
            if map[r][c] == 0 {
                blanks.append((r,c))
            }
            else {
                if !blanks.isEmpty {
                    let br = blanks[0].0
                    let bc = blanks[0].1
                    blanks.removeFirst()
                    map[br][bc] = map[r][c]
                    map[r][c] = 0
                    blanks.append((r,c))
                }
            }
        }
        
        dIndex += 1
        if dIndex == 4 {
            dIndex = 0
        }
    }
    
    return map
}

// 폭발
func explosion() -> Bool{
    var redoFlag = false
    var candidates = [(Int, Int)]()
    var curValue = -1
    
    let dr = [0,1,0,-1]
    let dc = [-1,0,1,0]
    var r = originR
    var c = originC
    
    var dIndex = 0
    for tIndex in 0..<traversalAmount.count {
        let amount = traversalAmount[tIndex]
        for _ in 0..<amount {
            r = r + dr[dIndex]
            c = c + dc[dIndex]
            
            if curValue == -1 {
                curValue = map[r][c]
                candidates.append((r,c))
            }
            else {
                if curValue == map[r][c] {
                    candidates.append((r,c))
                }
                else {
                    if candidates.count >= 4 {
                        redoFlag = true
                        if curValue == 1 {
                            numOneBeads += candidates.count
                        }
                        else if curValue == 2 {
                            numTwoBeads += candidates.count
                        }
                        else if curValue == 3 {
                            numThreeBeads += candidates.count
                        }
                        
                        for candidate in candidates {
                            map[candidate.0][candidate.1] = 0
                        }
                    }
                    
                    curValue = map[r][c]
                    candidates.removeAll()
                    candidates.append((r,c))
                }
            }
        }
        
        dIndex += 1
        if dIndex == 4 {
            dIndex = 0
        }
    }
    
    return redoFlag
}

//변화
func transition() -> [[Int]] {
    let dr = [0,1,0,-1]
    let dc = [-1,0,1,0]
    var r = originR
    var c = originC-1
    var dIndex = 1
    var curValue = map[r][c]
    var cnt = 1
    
    var newMap = Array(repeating: Array(repeating: 0, count: n), count: n)
    var ndIndex = 0
    var ntIndex = 0
    var nAmount = traversalAmount[ntIndex]
    var nAmountIndex = 0
    var nr = originR
    var nc = originC
    

    outer: for tIndex in 1..<traversalAmount.count {
        let amount = traversalAmount[tIndex]
        for _ in 0..<amount {
            r = r + dr[dIndex]
            c = c + dc[dIndex]
            
            if curValue == map[r][c] {
                cnt += 1
            }
            else {
                nr = nr + dr[ndIndex]
                nc = nc + dc[ndIndex]
                newMap[nr][nc] = cnt
                
                nAmountIndex += 1
                if nAmount <= nAmountIndex {
                    nAmountIndex = 0
                    ntIndex += 1
                    if ntIndex >= traversalAmount.count {
                        break outer
                    }
                    nAmount = traversalAmount[ntIndex]
                    ndIndex += 1
                    if ndIndex == 4 {
                        ndIndex = 0
                    }
                }
                
                nr = nr + dr[ndIndex]
                nc = nc + dc[ndIndex]
                newMap[nr][nc] = curValue
                
                nAmountIndex += 1
                if nAmount <= nAmountIndex {
                    nAmountIndex = 0
                    ntIndex += 1
                    if ntIndex >= traversalAmount.count {
                        break outer
                    }
                    nAmount = traversalAmount[ntIndex]
                    ndIndex += 1
                    if ndIndex == 4 {
                        ndIndex = 0
                    }
                }
                
                curValue = map[r][c]
                cnt = 1
            }
        }
        
        dIndex += 1
        if dIndex == 4 {
            dIndex = 0
        }
    }
    
    return newMap
}
