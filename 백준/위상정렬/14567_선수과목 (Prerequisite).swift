let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
var m = nm[1]

var children = Array(repeating: [Int](), count: n+1)
var count = Array(repeating: 0, count: n+1)
for _ in 0..<m {
    let ab = readLine()!.split(separator: " ").map { Int(String($0))! }
    let a = ab[0]
    let b = ab[1]
    children[a].append(b)
    count[b] += 1
}

var result = Array(repeating: 1, count: n+1)

// 1. BFS할 때 튜플 사용해서 거리랑 같이 넣기 -> queue에서 요소 뺄 때 마다 removeFirst 해야함
var queue = [(Int, Int)]()
var index = 0
var time = 2

for i in 1...n {
    if count[i] == 0 {
        queue.append((i, 1))
    }
}
while !queue.isEmpty {
        let element = queue.removeFirst()
        let current = element.0
        let time = element.1

        for next in children[current] {
            count[next] -= 1
            if count[next] == 0 {
                queue.append((next, time + 1))
                result[next] = time + 1
            }
        }
        index += 1
}

for i in 1..<result.count {
    time = result[i]
    print(time, terminator: " ")
}

// 2. BFS 할 때 index 활용하기 -> queue에 거리랑 같이 안넣어도 됨. index로 추적. queue는 계속 커짐
/*
var queue = [Int]()
var index = 0
var time = 2

for i in 0..<n {
    if count[i] == 0 {
        queue.append((i))
    }
}
while index < queue.count {
    for _ in 0..<queue.count-index {
        let current = queue[index]

        for next in children[current] {
            count[next] -= 1
            if count[next] >= 1 {
                continue
            }
            queue.append(next)
            result[next] = time
        }
        index += 1
    }
    time += 1
}

for i in 0..<result.count {
    time = result[i]
    print(time, terminator: " ")
}
*/
