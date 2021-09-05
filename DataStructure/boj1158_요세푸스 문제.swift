import Foundation

let input = readLine()!.split(separator: " ").map {Int($0)!}

var arr = [Int]()
for i in 0..<input[0]{
    arr.append(i+1)
}
var ptr = 0
var k = input[1]
var result = [Int]()
while arr.count > 0 {
    ptr += k-1
    while ptr >= arr.count {
        ptr -= arr.count
    }
    result.append(arr.remove(at: ptr))
}

print("<", terminator: "")
for i in 0..<result.count{
    if i != result.count-1{
        print(result[i], terminator: ", ")
    }
    else{
        print(result[i], terminator: "")
    }
}
print(">")
