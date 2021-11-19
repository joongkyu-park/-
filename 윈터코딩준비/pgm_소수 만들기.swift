import Foundation

func solution(_ nums:[Int]) -> Int {
    var answer = 0
    
    func isPrime(_ num: Int) -> Bool {
        var sqrtNum = Int(ceil(sqrt(Double(num))))
        for i in 2...sqrtNum {
            if num % i == 0 {
                return false
            }
        }
        return true
    }
    
    for i in 0..<nums.count {
        for j in i..<nums.count {
            for k in j..<nums.count {
                if i == j || i == k || j == k {
                    continue
                }
                else {
                    let sum = nums[i] + nums[j] + nums[k]
                    if isPrime(sum) {
                        answer += 1
                    }
                }
            }
        }
    }
    
    return answer
}
