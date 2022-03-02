// 개념이해 : https://devowen.com/300

let nk = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nk[0]
let k = nk[1]

var gems = [(Int,Int)]()
var backs = [Int]()

for _ in 0..<n{
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    gems.append((input[0],input[1]))
}
for _ in 0..<k{
    let input = Int(readLine()!)!
    backs.append(input)
}

backs.sort()
gems.sort{$0.0<$1.0}


var sum: Int64 = 0
var pq = MaxHeap(nodes: [])
var backIndex = 0
var gemIndex = 0


while backIndex < k && gemIndex < n{
    
    for i in gemIndex..<n{
        if gems[i].0 <= backs[backIndex]{
            pq.insert(gems[i].1)
        }
        else {
            gemIndex = i
            break
        }
    }
    
    if !pq.isEmpty(){
        sum += Int64(pq.top())
        pq.remove()
    }
    backIndex += 1
}

print(sum)







// heap코드 : https://fomaios.tistory.com/entry/Data-Structure-%ED%9E%99Heap%EC%9D%B4%EB%9E%80-feat-Swift
struct MaxHeap {
    var nodes:[Int] = []
    
    init(nodes:[Int]) {
        nodes.forEach {
            insert($0)
        }
    }
    
    private func getLeftChildIndex(_ parentIndex: Int) -> Int {
        return 2 * parentIndex + 1
    }
    
    private func getRightChildIndex(_ parentIndex: Int) -> Int {
        return 2 * parentIndex + 2
    }
    
    private func getParentIndex(_ childIndex: Int) -> Int {
        return (childIndex - 1) / 2
    }
    
    private func hasLeftChild(_ index: Int) -> Bool {
        return getLeftChildIndex(index) < nodes.count
    }
    
    private func hasRightChild(_ index: Int) -> Bool {
        return getRightChildIndex(index) < nodes.count
    }
    
    private func hasParent(_ index: Int) -> Bool {
        return getParentIndex(index) >= 0
    }
    
    mutating private func heapifyUp() {
        var index = nodes.count - 1
        while hasParent(index) && nodes[getParentIndex(index)] < nodes[index] {
            nodes.swapAt(getParentIndex(index),index)
            index = getParentIndex(index)
        }
    }
    
    mutating func insert(_ node:Int) {
        nodes.append(node)
        heapifyUp()
    }
    
    mutating private func heapifyDown() {
        var index = 0
        while hasLeftChild(index) {
            let leftIndex:Int = getLeftChildIndex(index)
            let rightIndex:Int = getRightChildIndex(index)
            var biggerChildIndex = leftIndex
            if hasRightChild(index) && nodes[leftIndex] < nodes[rightIndex] {
                biggerChildIndex = rightIndex
            }
            if nodes[index] > nodes[biggerChildIndex] {
                break
            } else {
                nodes.swapAt(index, biggerChildIndex)
            }
            index = biggerChildIndex
        }
    }
    
    mutating func remove()  {
        if nodes.isEmpty {
            return
        }
        nodes.swapAt(0, nodes.count - 1)
        nodes.removeLast()
        heapifyDown()
    }
    
    mutating func top() -> Int{
        if nodes.isEmpty {
            return -1
        }
        return nodes[0]
    }
    
    mutating func isEmpty() -> Bool{
        if nodes.isEmpty {
            return true
        }
        else { return false}
    }
    
}
