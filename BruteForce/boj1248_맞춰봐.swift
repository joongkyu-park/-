import Foundation

var N = Int(readLine()!)!
var input = readLine()!.map{String($0)}

var matrix = [[String]](repeating: Array(repeating: "", count: N), count: N)
var arr = [Int](repeating: 0, count: N)
var sign = [String](repeating: "", count: N)
var index = 0
for i in 0..<N {
    for j in i..<N{
        if i == j {
            sign[i] = input[index]
        }
        matrix[i][j] = input[index]
        index += 1
    }
}
func check(_ arr: [Int], _ cnt: Int)-> Int{
    for i in 0...cnt{
        var sum = 0
        for j in i...cnt{
            sum += arr[j]
            if matrix[i][j] == "+" {
                if sum > 0{
                    continue
                }
                else {
                    return -1
                }
            }
            else if matrix[i][j] == "-"{
                if sum < 0{
                    continue
                }
                else {
                    return -1
                }
            }
            else {
                if sum == 0{
                    continue
                }
                else {
                    return -1
                }
            }
        }
    }
    return 0
}
for i in 0..<N{
    if sign[i] == "+"{
        arr[i] = 1
    }
    else if sign[i] == "-"{
        arr[i] = -10
    }
    else {
        arr[i] = 0
    }
}
var initialValue = arr

func dfs(_ cnt: Int) -> Int{
    if cnt == N{
        var flag = 0
        
        for i in 0..<N{
            var sum = 0
            for j in i..<N{
                sum += arr[j]
                if matrix[i][j] == "+"{
                    if sum > 0{
                        continue
                    }
                    else {
                        flag = -1
                        break
                    }
                }
                else if matrix[i][j] == "-"{
                    if sum < 0{
                        continue
                    }
                    else {
                        flag = -1
                        break
                    }
                }
                else {
                    if sum == 0{
                        continue
                    }
                    else {
                        flag = -1
                        break
                    }
                }
            }
            if flag == -1{
                break
            }
        }
        if flag == 0{
            return 0
        }
        else {
            return -1
        }
    }
    for i in -10...10{
        if arr[cnt] > i {
            continue
        }
        else{
            arr[cnt] = i
            var c = check(arr, cnt)
            if c == -1{
                continue
            }
            else{
                var tmp = dfs(cnt+1)
                if tmp == 0{
                    return 0
                }
                else{
                    for k in cnt..<arr.count{
                        arr[k] = initialValue[k]
                    }
                    continue
                }
            }
        }
    }
    return -1
}

dfs(0)

for i in 0..<arr.count{
    print(arr[i], terminator: " ")
}
print()
