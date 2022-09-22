/*
 https://www.youtube.com/watch?v=zpz8SMzwiHM
 */
import Foundation

func solution(_ food_times:[Int], _ k:Int64) -> Int {
    var food_times_sorted = [[Int]]() // 원래 index, time
    for (i, time) in food_times.enumerated() {
        food_times_sorted.append([i, time])
    }
    food_times_sorted.sort {
        $0[1] > $1[1]
    }
    var k = Int(k)
    var index = food_times_sorted.count-1
    
    food_times_sorted.append([-1,0])
    var delta = food_times_sorted[index][1] - food_times_sorted[index+1][1]
    
    while delta*(index+1) <= k {
        k -= delta*(index+1)
        index -= 1
        food_times_sorted.removeLast()
        if index == -1 {
            return -1
        }
        delta = food_times_sorted[index][1] - food_times_sorted[index+1][1]
    }
    food_times_sorted.removeLast()
    food_times_sorted.sort {
        $0[0] < $1[0]
    }
    index = 0
    if k >= food_times_sorted.count{
        k = k % food_times_sorted.count
    }
    
    
    return food_times_sorted[k][0] + 1
}
