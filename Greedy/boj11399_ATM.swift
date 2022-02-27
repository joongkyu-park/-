let n = Int(readLine()!)!
var input = readLine()!.split(separator: " ").map{Int(String($0))!}

input.sort()

var sum = 0
for i in 0..<input.count{
    for j in 0...i{
        sum += input[j]
    }
}

print(sum)
