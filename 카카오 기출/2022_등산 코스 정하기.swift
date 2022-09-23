/*
 for문에서 gate를 기준으로 순회했을 때는 테케 15, 16번이 틀림
 -> summit을 만나면 바로 break시키는데, intensity는 같고 번호가 낮은 summit을 만나지 못하고 종료할 수 있음!
 -> gate 기준으로 for문 돌리면 한 번도 방문당하지 못하는 summit이 생길 수 있음.
 
 따라서 summit을 정렬시키고 summit 기준으로 for문 돌리면 됨. gate만나면 break
 -> 방문당하지 못하는 summit 발생 x
 */
import Foundation

func solution(_ n:Int, _ paths:[[Int]], _ gates:[Int], _ summits:[Int]) -> [Int] {

    var linkedList = Array(repeating: [(Int, Int)](), count: n+1) //node, weight
    var isGate = Array(repeating: false, count: n+1)
    var isSummit = Array(repeating: false, count: n+1)
    
    for path in paths {
        let v = path[0]
        let w = path[1]
        let d = path[2]
        linkedList[v].append((w,d))
        linkedList[w].append((v,d))
    }
    for gate in gates {
        isGate[gate] = true
    }
    for summit in summits {
        isSummit[summit] = true
    }
    
    var answers = [[Int]]()
    var intensity = 0
    let summits = summits.sorted()
    for summit in summits {
        var visited = Array(repeating: false, count: n+1)
        intensity = 0
        
        let pq = PriorityQueue<(Int, Int)>() {
            return $0.1 < $1.1
        }
        visited[summit] = true
        pq.push((summit, intensity))
        
        while !pq.isEmpty() {
            let element = pq.pop()!
            let node = element.0
            let weight = element.1

            visited[node] = true
            if weight > intensity {
                intensity = weight
            }
            
            if isGate[node] {
                answers.append([summit, intensity])
                break
            }
        
            for fringe in linkedList[node] {
                if isSummit[fringe.0] || visited[fringe.0] {
                    continue
                }
                pq.push(fringe)
            }
        }
    }
    answers.sort { $0[0] < $1[0] }
    answers.sort { $0[1] < $1[1] }
    
    return answers.first!
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
