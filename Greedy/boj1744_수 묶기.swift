import Foundation

let n = Int(readLine()!)!

var arr = [Int]()

for _ in 0..<n{
    let input = Int(readLine()!)!
    arr.append(input)
}

arr.sort{$0>$1}

var answer = 0

while arr.count > 0{
    if arr.count == 1{
        answer += arr[0]
        arr.removeFirst()
    }
    else {
        if arr[0]>0{
            if arr[1]>0{
                if arr[0]+arr[1] < arr[0]*arr[1]{
                    answer += arr[0]*arr[1]
                }
                else{
                    answer += arr[0]+arr[1]
                }
                arr.removeFirst()
                arr.removeFirst()
            }
            else{
                answer += arr[0]
                arr.removeFirst()
            }
        }
        else {
            break
        }
    }
}
arr.sort()

while arr.count > 0{
    if arr.count == 1{
        answer += arr[0]
        arr.removeFirst()
    }
    else {
        if arr[0]<0{
            if arr[1]<0{
                answer += arr[0]*arr[1]
                arr.removeFirst()
                arr.removeFirst()
            }
            else{
                break
            }
        }
        else {
            break
        }
    }
}

print(answer)
