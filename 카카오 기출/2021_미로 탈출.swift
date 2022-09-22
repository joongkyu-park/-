/*
 https://school.programmers.co.kr/questions/34692
 https://www.youtube.com/watch?v=MaVaofAobXw
 https://velog.io/@jujube0/2021-%EC%B9%B4%EC%B9%B4%EC%98%A4-%EC%B1%84%EC%9A%A9%EC%97%B0%EA%B3%84%ED%98%95-%EC%9D%B8%ED%84%B4%EC%8B%AD#%EC%B6%94%EA%B0%80-%ED%85%8C%EC%8A%A4%ED%8A%B8-%EC%BC%80%EC%9D%B4%EC%8A%A4
 */
import Foundation

func solution(_ n:Int, _ start:Int, _ end:Int, _ roads:[[Int]], _ traps:[Int]) -> Int {
    
    var adjacentMatrix = Array(repeating: Array(repeating: -1, count: n+1), count: n+1 )
    
    for road in roads {
        let start = road[0]
        let destination = road[1]
        let distance = road[2]
        if adjacentMatrix[start][destination] != -1 {
            if adjacentMatrix[start][destination] > distance {
                adjacentMatrix[start][destination] = distance
            }
        }
        else {
            adjacentMatrix[start][destination] = distance
        }
    }
    var trapIndexMap = [Int: Int]() // trap node: trap index
    for (i, trap) in traps.enumerated() {
        trapIndexMap[trap] = i
    }
    
    var isTrap = Array(repeating: false, count: n+1)
    traps.forEach {
        isTrap[$0] = true
    }
    var visited = Array(repeating: Array(repeating: false, count: n+1), count: Int(pow(Double(2), Double(traps.count))))
    // state, node
    let pq = PriorityQueue<(Int, Int, Int)>() { // node, cost, state
        return $0.1 <= $1.1
    }
    var answer = 0
    visited[0][start] = true
    pq.push((start, 0, 0))
    
    while !pq.isEmpty() {
        let element = pq.pop()!
        let node = element.0
        let cost = element.1
        
        var state = element.2
        
        visited[state][node] = true
        
        var curTrapped = false
        if isTrap[node] {
            let trapIndex = trapIndexMap[node]!
            state = state ^ (1<<trapIndex)
            
            if (1<<trapIndex) & state != 0 {
                curTrapped = true
            }
        }
        
        if node == end {
            answer = cost
            break
        }
        
        var nextTrapped = false
        for i in 1...n {
            if node == i { continue }
            if visited[state][i] { continue }
            
            nextTrapped = false
            if isTrap[i] {
                let nextTrapIndex = trapIndexMap[i]!
                if (1<<nextTrapIndex) & state != 0 {
                    nextTrapped = true
                }
            }
            
            if (curTrapped == true) && (nextTrapped == true) {
                if adjacentMatrix[node][i] != -1 {
                    pq.push((i, cost + adjacentMatrix[node][i], state))
                }
            }
            else if (curTrapped == false) && (nextTrapped == false) {
                if adjacentMatrix[node][i] != -1 {
                    pq.push((i, cost + adjacentMatrix[node][i], state))
                }
            }
            else if (curTrapped == true) && (nextTrapped == false) {
                if adjacentMatrix[i][node] != -1 {
                    pq.push((i, cost + adjacentMatrix[i][node], state))
                }
            }
            else if (curTrapped == false) && (nextTrapped == true) {
                if adjacentMatrix[i][node] != -1 {
                    pq.push((i, cost + adjacentMatrix[i][node], state))
                }
            }
        }
        
        
    }
    
    return answer
}


class PriorityQueue<T> {
    private var heap: [T] = []
    private let comparing: (_ o1: T,_ o2: T) -> Bool
    
    init(_ comparing: @escaping (_ o1: T,_ o2: T) -> Bool) {
        self.comparing = comparing
    }
    
    func size() -> Int { heap.count }
    
    func isEmpty() -> Bool { heap.isEmpty }
    
    func clear() { heap.removeAll() }
    
    func peek() -> T? { heap.first }
    
    func push(_ value: T) {
        heap.append(value)
        if heap.count == 1 { return }
        var valueIndex = heap.count - 1
        var parentIndex = (valueIndex-1) / 2
        while !comparing(heap[parentIndex], heap[valueIndex]) {
            heap.swapAt(valueIndex, parentIndex)
            valueIndex = parentIndex
            parentIndex = (valueIndex-1) / 2
            if valueIndex == 0 { break }
        }
    }
    
    func pop() -> T? {
        if heap.count == 0 { return nil }
        if heap.count == 1 { return heap.removeFirst() }
        
        func isChildEmpty(_ value: Int,_ left: Int,_ right: Int) -> Bool {
            if heap.count <= left { return true }
            if heap.count > right { return false }
            if comparing(heap[value], heap[left]) { return true }
            heap.swapAt(value, left)
            return true
        }
        
        heap.swapAt(0, heap.count-1)
        let answer = heap.removeLast()
        
        var valueIndex = 0
        var leftIndex = valueIndex * 2 + 1
        var rightIndex = valueIndex * 2 + 2
        
        if isChildEmpty(valueIndex, leftIndex, rightIndex) { return answer }
        
        while !comparing(heap[valueIndex], heap[leftIndex]) || !comparing(heap[valueIndex], heap[rightIndex]) {
            let index = comparing(heap[leftIndex], heap[rightIndex]) ? leftIndex : rightIndex
            heap.swapAt(valueIndex, index)
            valueIndex = index
            leftIndex = valueIndex * 2 + 1
            rightIndex = valueIndex * 2 + 2
            
            if isChildEmpty(valueIndex, leftIndex, rightIndex) { break }
        }
        return answer
    }
}

