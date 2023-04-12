let nt = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nt[0]
let t = nt[1]

var coordinates = Set<String>()
for _ in 0..<n {
    let coordinate = readLine()!
    coordinates.insert(coordinate)
}

var dp = Array(repeating: Array(repeating: -1, count: t + 1), count: 1000001)

var answer = -1

var queue = Array<(Int, Int, Int)>()
queue.append((0, 0, 0))
while !queue.isEmpty {
    let (x, y, count) = queue.removeFirst()
    for dx in -2...2 {
        for dy in -2...2 {
            let newX = x + dx
            let newY = y + dy
            
            if coordinates.contains("\(newX) \(newY)") {
                if dp[newX][newY] == -1 || dp[newX][newY] > (count + 1) {
                    dp[newX][newY] = count + 1
                    if newY == t {
                        if answer == -1 {
                            answer = count + 1
                        }
                        else if answer > count + 1 {
                            answer = count + 1
                        }
                    }
                    queue.append((newX, newY, count + 1))
                }
            }
        }
    }
}

print(answer)
