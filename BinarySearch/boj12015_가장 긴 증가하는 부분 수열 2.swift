//참고:https://23dotory.tistory.com/24
import Foundation

let n = Int(readLine()!)!

let input = readLine()!.split(separator: " ").map{Int(String($0))!}

var arr = [Int]()
arr.append(input[0])

for i in 1..<n{
    if arr[arr.count-1] < input[i]{
        arr.append(input[i])
    }
    else {
        let criteria = input[i]
        let index = bs(criteria)
        arr[index] = criteria
    }
}

print(arr.count)

func bs(_ cr: Int) -> Int{
    var first = 0
    var end = arr.count-1
    var mid = (first+end)/2
    
    while first < end{
        if arr[mid] > cr{
            end = mid-1
        }
        else if arr[mid] < cr{
            first = mid+1
        }
        else{
            break
        }
        mid = (first+end)/2
    }
    while arr[mid] < cr{
        mid += 1
    }
    return mid
}
