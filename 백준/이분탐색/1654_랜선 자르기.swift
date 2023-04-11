let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
let k = nk[0]
let n = nk[1]

var lanLines = [Int]()
for _ in 0..<k {
    let line = Int(readLine()!)!
    lanLines.append(line)
}

lanLines.sort()

var l = 1
var r = lanLines[k-1]
var result = 0
while l <= r {
    let mid = Int((Double(l) + Double(r)) / Double(2))
    
    var count = 0
    for i in 0..<k {
        let line = lanLines[i]
        count += (line / mid)
    }
    
    if count >= n {
        result = mid
        l = mid + 1
    }
    else {
        r = mid - 1
    }
}

print(result)
