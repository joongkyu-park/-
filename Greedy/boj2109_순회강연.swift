import Foundation

let n = Int(readLine()!)!

if n == 0{
    print(0)
    exit(0)
}
var arr = [(Int,Int)]()
for _ in 0..<n{
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    arr.append((input[0],input[1]))
}

arr.sort{$0.0>$1.0}
arr.sort{$0.1>$1.1}
var pq = MaxHeap(nodes: [])
var sum = 0
var d = arr[0].1
var flag = false

for i in 0..<n{
    if d == arr[i].1{
        pq.insert(arr[i].0)
    }
    else{
        while d > arr[i].1 && !pq.isEmpty(){
            sum += pq.top()
            pq.remove()
            d -= 1
        }
        pq.insert(arr[i].0)
        d = arr[i].1
    }
}
while d > 0 && !pq.isEmpty(){
    sum += pq.top()
    pq.remove()
    d -= 1
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
