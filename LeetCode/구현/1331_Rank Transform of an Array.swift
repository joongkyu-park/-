class Solution {
    
    func arrayRankTransform(_ arr: [Int]) -> [Int] {
        
        if arr.count == 0 {
            return []
        }
        
        var tuples = [(Int, Int)]()
        for i in 0..<arr.count {
            tuples.append((arr[i], i)) // num, original index
        }
        tuples.sort { $0.0 < $1.0 }
        var tuplesWithRank: [(Int, Int, Int)] = [(tuples[0].0, tuples[0].1, 1)] // num, original index, rank
        var rank = 1
        var num = tuples[0].0
        for i in 1..<tuples.count {
            let curNum = tuples[i].0
            if num == curNum {
                tuplesWithRank.append((tuples[i].0, tuples[i].1, rank))
            }
            else {
                rank += 1
                num = curNum
                tuplesWithRank.append((tuples[i].0, tuples[i].1, rank))
            }
        }
        tuplesWithRank.sort { $0.1 < $1.1 }
        
        var result = [Int]()
        for i in 0..<tuplesWithRank.count {
            result.append(tuplesWithRank[i].2)
        }
        
        return result
        
    }
    
}
