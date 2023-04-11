let n = Int(readLine()!)!

var times = Array<(Int, Int)>()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let start = input[0]
    let end = input[1]
    times.append((start, end))
}

times.sort { $0.0 < $1.0 }
times.sort { $0.1 < $1.1 }

var count = 0
var index = 0
var curTime = 0
while index < n {
    let element = times[index]
    let start = element.0
    let end = element.1
    
    if start >= curTime {
        count += 1
        index += 1
        curTime = end
    }
    else {
        index += 1
    }
}

print(count)
