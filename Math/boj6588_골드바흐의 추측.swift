import Foundation


var n = Int(readLine()!)!

while n != 0 {
    if n == 6 {
        print("\(n) = 3 + 3")
    }
    else{
        var flag = 1
        var p1: Double = 3
        var p2 = Double()
        while flag != 0 {
            p2 = Double(n) - p1
            
            var divisor  = 3
            while divisor <= Int(sqrt(p2))+1 {
                if Int(p2) % divisor == 0 {
                    flag = 1
                    break
                }
                else {
                    flag = 0
                    divisor += 2
                }
            }
            if flag == 0 {
                break
            }
            else {
                divisor = 3
                p1 += 2
                while divisor <= Int(sqrt(Double(p1)))+1{
                    if Int(p1) % divisor == 0 {
                        p1 += 2
                        divisor = 3
                        continue
                    }
                    else {
                        divisor += 2
                    }
                }
            }
        }
        print("\(n) = \(Int(p1)) + \(Int(p2))")
    }
    n = Int(readLine()!)!
}
