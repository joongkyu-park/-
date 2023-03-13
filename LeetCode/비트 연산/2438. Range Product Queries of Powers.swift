class Solution {
    func productQueries(_ n: Int, _ queries: [[Int]]) -> [Int] {
        var powers = [Int]()
        var num = 1
        while num <= n {
            if n & num > 0 {
                powers.append(num)
            }
            num = num << 1
        }
        
        var answer = [Int]()
        for query in queries {
            var num = 1
            for i in query[0]...query[1] {
                num = num * powers[i]
                num = num % 1000000007
            }
            answer.append(num)
        }
        
        return answer
    }
}
