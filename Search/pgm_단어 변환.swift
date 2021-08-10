import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var resultIndex = -1
    var flag = 0
    for i in 0..<words.count{
        if words[i] == target {
            flag=1
            resultIndex = i
        }
    }
    if flag == 0 {return 0}
    
    var queue = [String]()
    
    var distances = [Int]()
    var visited = [Int]()
    
    for _ in 0..<words.count{
        distances.append(0)
        visited.append(0)
    }
    
    func BFS(_ word: String) {
        var value = 0
        if word == begin {} else {
            for i in 0..<words.count {
                if words[i] == word {
                    value = distances[i]
                    break
                }
            }
        }
        for i in 0..<words.count{
            var count = 0
            if word == words[i] { continue }
            for j in 0..<word.count{
                if word[word.index(word.startIndex, offsetBy: j)] != words[i][words[i].index(words[i].startIndex, offsetBy: j)] {count += 1}
                if count >= 2 {break}
            }
            if count == 1 && visited[i] == 0{
                distances[i] =  value + 1
                visited[i] = 1
                queue.append(words[i])
            }
        }
    }
    
    queue.append(begin)
    while queue.count != 0 {
        let str: String = queue.removeFirst()
        BFS(str)
    }
    
    return distances[resultIndex]
    
}
