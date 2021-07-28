import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    
    var time = 0
    var on_bridge  = [Int]()
    var distances = [Int]()
    var sum = 0
    var trucks = truck_weights
    
    while true {
        time += 1
        
        if distances.count > 0{
            for i in 0..<distances.count {
                distances[i] += 1
            }
            if distances[0] > bridge_length {
                sum -= on_bridge[0]
                distances.remove(at: 0)
                on_bridge.remove(at: 0)
            }
        }
        
        if trucks.count > 0 {
            if sum + trucks[0] <= weight {
                on_bridge.append(trucks[0])
                distances.append(1)
                sum += trucks[0]
                trucks.remove(at: 0)
            }
        }
        
        if trucks.count == 0 && on_bridge.count == 0 {
            break
        }
    }
    
    return time
}
