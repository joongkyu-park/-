import Foundation

//입력 받기
var input = readLine()!.split(separator: " ").map{(Int($0)!)}

var m: Int = input[0]
var n: Int = input[1]
var max = m*n
var cnt = 0
var ripenedArr = [[Int]]()

var box = Array(repeating: Array(repeating: 0, count: m), count: n)
var visited = Array(repeating: Array(repeating: 0, count: m), count: n)
for y in 0..<n {
    var line = readLine()!.split(separator: " ").map{(Int($0)!)}
    for x in 0..<m {
        box[y][x] = line[x]
        if line[x] == -1{
            max -= 1
        }
        else if line[x] == 1{
            ripenedArr.append([y,x])
            cnt += 1
        }
    }
}

var day = 0

if cnt == max{
    print(0)
}
else{
    func ripening() {
        var tmpArr = [[Int]]()
        
        for i in 0..<ripenedArr.count{
            var y = ripenedArr[i][0]
            var x = ripenedArr[i][1]
            
            //왼쪽
            if x-1 >= 0 && box[y][x-1] == 0{
                tmpArr.append([y,x-1])
                box[y][x-1] = 1
                cnt += 1
            }
            //오른쪽
            if x+1 < m && box[y][x+1] == 0 {
                tmpArr.append([y,x+1])
                box[y][x+1] = 1
                cnt += 1
            }
            //위쪽
            if y-1 >= 0 && box[y-1][x] == 0 {
                tmpArr.append([y-1,x])
                box[y-1][x] = 1
                cnt += 1
            }
            //아래쪽
            if y+1 < n && box[y+1][x] == 0 {
                tmpArr.append([y+1,x])
                box[y+1][x] = 1
                cnt += 1
            }
        }
        ripenedArr = tmpArr
    }
    
    
    while ripenedArr.count > 0{
        
        ripening()
        day += 1
        
        if max == cnt {
            break
        }
        
    }
    if max == cnt{
        print(day)
    }
    else{
        print(-1)
    }
}
