import Foundation

let size = readLine()!.split(separator: " ").map{Int($0)!}

var coordinate = [[Int]](repeating: Array(repeating: 0, count: size[1]), count: size[0])
for i in 0..<size[0] {
    let arr = readLine()!.split(separator: " ").map{Int($0)!}
    
    for j in 0..<arr.count {
        coordinate[i][j] = arr[j]
    }
}

var result = 0

var a1 = [[0,0],[0,1],[0,2],[0,3]]
var a2 = [[0,0],[1,0],[2,0],[3,0]]

var b = [[0,0],[0,1],[1,0],[1,1]]

var c1 = [[0,0],[1,0],[2,0],[0,1]]
var c2 = [[0,0],[0,1],[0,2],[1,2]]
var c3 = [[2,0],[0,1],[1,1],[2,1]]
var c4 = [[0,0],[1,0],[1,1],[1,2]]
var c5 = [[0,0],[1,0],[2,0],[2,1]]
var c6 = [[1,0],[1,1],[0,2],[1,2]]
var c7 = [[0,0],[0,1],[1,1],[2,1]]
var c8 = [[0,0],[1,0],[0,1],[0,2]]

var d1 = [[0,0],[0,1],[1,1],[1,2]]
var d2 = [[1,0],[2,0],[0,1],[1,1]]
var d3 = [[1,0],[0,1],[1,1],[0,2]]
var d4 = [[0,0],[1,0],[1,1],[2,1]]

var e1 = [[1,0],[0,1],[1,1],[2,1]]
var e2 = [[0,0],[1,0],[2,0],[1,1]]
var e3 = [[1,0],[0,1],[1,1],[1,2]]
var e4 = [[0,0],[0,1],[0,2],[1,1]]

var wholeForms = [[[Int]]]()
wholeForms.append(a1)
wholeForms.append(a2)

wholeForms.append(b)

wholeForms.append(c1)
wholeForms.append(c2)
wholeForms.append(c3)
wholeForms.append(c4)
wholeForms.append(c5)
wholeForms.append(c6)
wholeForms.append(c7)
wholeForms.append(c8)

wholeForms.append(d1)
wholeForms.append(d2)
wholeForms.append(d3)
wholeForms.append(d4)

wholeForms.append(e1)
wholeForms.append(e2)
wholeForms.append(e3)
wholeForms.append(e4)

func check(_ cur: [[Int]]){
    for i in 0..<size[1]{
        for j in 0..<size[0]{
            if cur[0][0]+j < size[0] && cur[1][0]+j < size[0] && cur[2][0]+j < size[0] && cur[3][0]+j < size[0] {
                if cur[0][1]+i < size[1] && cur[1][1]+i < size[1] && cur[2][1]+i < size[1] && cur[3][1]+i < size[1]{
                    result = max(result,coordinate[cur[0][0]+j][cur[0][1]+i] + coordinate[cur[1][0]+j][cur[1][1]+i] + coordinate[cur[2][0]+j][cur[2][1]+i] + coordinate[cur[3][0]+j][cur[3][1]+i])
                }
            }
        }
    }
}

for i in 0..<wholeForms.count {
    check(wholeForms[i])
}
print(result)
