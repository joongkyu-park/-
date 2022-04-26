import Foundation

func solution(_ enroll:[String], _ referral:[String], _ seller:[String], _ amount:[Int]) -> [Int] {
    
    var dic = [String: Int]()
    var tree = Array(repeating: 0, count: enroll.count+1)
    var money = Array(repeating: 0, count: enroll.count+1)
    tree[0] = -1
    
    for (index, name) in enroll.enumerated() {
        dic[name] = index+1
    }
    for (index, name) in referral.enumerated() {
        let parentIndex: Int = dic[name] ?? 0
        tree[index+1] = parentIndex
    }
    for (index, name) in seller.enumerated() {
        
        var curAmount: Double = Double(amount[index] * 100)
        var parentAmount: Double = 0.0
        var curIndex = dic[name]!
        
        while tree[curIndex] != -1 {
            let originalAmount = curAmount
            if originalAmount == 0.0 {
                break
            }
            parentAmount = curAmount * 0.1
            curAmount = curAmount * 0.9
            
            if Int(curAmount) + Int(parentAmount) < Int(originalAmount) {
                curAmount += 1.0
            }
            money[curIndex] += Int(curAmount)
            
            curAmount = parentAmount
            curIndex = tree[curIndex]
        }
        
    }
    
    var result = [Int]()
    
    for i in 1..<money.count {
        result.append(money[i])
    }
    
    return result
}
