 /*
  - 함수의 파라메터는 value 형태로 들어오므로 변경할 수 없는 let이다.
  따라서 함수내에 var 변수를 하나 생성하여 넣어주고 변형시켜야한다.
  */
 import Foundation

 func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
     var progress = progresses
     var index = 0
     var cnt = 0
     var result = [Int]()
     
     while true {
         for i in index..<progress.count{
             progress[i] += speeds[i]
         }
         
         while true {
             if index < progress.count && progress[index] >= 100 {
                 index += 1
                 cnt += 1
             }
             else {
                 break
             }
         }
         if cnt > 0 {
             result.append(cnt)
         }
         cnt = 0
         
         if index >= progress.count {
             break
         }
     }
     
     return result
 }
