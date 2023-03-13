class Solution {
    func findRepeatedDnaSequences(_ s: String) -> [String] {
        let s = Array(s)
        if s.count < 10 {
            return []
        }
        var seen = Set<String>()
        var answer = Set<String>()
        for start in 0..<(s.count-9) {
            let end = start + 9
            let str = String(s[start...end])
            if seen.contains(str) {
                answer.insert(str)
            }
            else {
                seen.insert(str)
            }
        }
        return Array(answer)
    }
}

/*
아래 코드처럼 일부러 String을 배열로 바꾸지 않고 String.index를 사용해서 구현했는데 시간초과남.
앞으로는 굳이 String.index를 사용하기보다는 배열로 바꿔서 사용해야할 듯.
 
class Solution {
    func findRepeatedDnaSequences(_ s: String) -> [String] {
        if s.count < 11 {return []}
        let s = Array(s)
        var seen = Set<String>()
        var res = Set<String>()
        for r in 9..<s.count {
            print("인덱스: \(r)")
            let str = String(s[r-9...r])
            if !seen.insert(str).inserted {
                res.insert(str)
            }
        }
        return Array(res)
    }
}
*/
