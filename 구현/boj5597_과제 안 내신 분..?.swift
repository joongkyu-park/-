var visited = Array(repeating: false, count: 31)
for _ in 0..<28 {
    let input = Int(readLine()!)!
    visited[input] = true
}
for i in 1...30 {
    if visited[i] == false {
        print(i)
    }
}
