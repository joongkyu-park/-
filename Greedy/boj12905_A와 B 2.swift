import Foundation

let s = Array(readLine()!).map{String($0)}
var t = Array(readLine()!).map{String($0)}
var answer = 0

check(t)
print(answer)

func check(_ arr: [String]){
    if arr.count == s.count{
        if arr == s{
            answer = 1
        }
        return
    }
    let arr = arr
    
    if arr[0] == "B" {
        var arr1 = arr
        arr1.reverse()
        arr1.removeLast()
        check(arr1)
    }
    if arr[arr.count-1] == "A"{
        var arr2 = arr
        arr2.removeLast()
        check(arr2)
    }
}

