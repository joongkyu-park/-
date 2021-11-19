/*
 정확성 100점, 효율성 0점 코드
 
 import Foundation

 func solution(_ n:Int, _ stations:[Int], _ w:Int) -> Int{
     var state = Array(repeating: 0, count: n+1)
     
     for i in 0..<stations.count{
         let station = stations[i]
         
         state[station] = 1
         for value in 1...w {
             if station-value < 0 {
                 break
             }
             else {
                 state[station-value] = 1
             }
         }
         for value in 1...w {
             if station+value > n{
                 break
             }
             else {
                 state[station+value] = 1
             }
         }
     }
     
     var result = 0
     var cnt = 0
     var flag = 0
     var index = 1
     
     while index < n {
         if index == 14 {
             
         }
         if state[index] == 0{
             if state[index+1] == 1 || cnt >= w{
                 result += 1
                 
                 state[index] = 1
                 for value in 1...w {
                     if index-value < 0 {
                         break
                     }
                     else {
                         state[index-value] = 1
                     }
                 }
                 for value in 1...w {
                     if index+value > n{
                         break
                     }
                     else {
                         state[index+value] = 1
                     }
                 }
                 
                 cnt = 0
             }
             else {
                 cnt += 1
             }
         }
         index += 1
     }
     if state[index] == 0{
         result += 1
     }
     
     return result
 }

 */

// 풀이참조 : https://hongdonghyun.github.io/2020/05/Swift-%EA%B8%B0%EC%A7%80%EA%B5%AD-%EC%84%A4%EC%B9%98/
import Foundation

func solution(_ n:Int, _ stations:[Int], _ w:Int) -> Int{
    var stationIndex = 0
    var location = 1
    
    var answer = 0
    
    while location <= n {
        if stationIndex < stations.count && location >= stations[stationIndex]-w && location <= stations[stationIndex]+w{
            location = stations[stationIndex]+w+1
            stationIndex += 1
        }
        else {
            answer += 1
            location += 2*w+1
        }
    }
    return answer
}
