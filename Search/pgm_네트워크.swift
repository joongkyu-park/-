import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    // 0 : Undiscoverd, 1: Discoverd
    var state = [Int]()
    for i in 0..<n {
        state.append(0)
    }
    
    func DFS(_ index: Int) {
        for i in 0..<n {
            if state[i] == 0 && computers[index][i] == 1{
                state[i] = 1
                DFS(i)
            }
        }
        return
    }
    
    func check() -> Int{
        for i in 0..<state.count {
            if state[i] == 0 {return i}
        }
        return -1
    }
    
    var result = 0
    while true {
        var index = check()
        if index == -1 {break}
        else {
            state[index] = 1
            DFS(index)
            result += 1
        }
    }
    return result
}
