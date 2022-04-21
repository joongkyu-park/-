import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int
{
    var answer = 0

    var arr = Array(repeating: false, count: n+1)
    arr[a] = true
    arr[b] = true
    
    func search(_ arr: [Bool], _ cnt: Int){
        var curArr = [Bool]()
        curArr.append(false)
        
        var index = 1
        
        while index < arr.count {
            if arr[index] == true && arr[index+1] == true{
                answer = cnt
                return
            }
            else if arr[index] == false && arr[index+1] == false{
                curArr.append(false)
                index += 2
            }
            else {
                curArr.append(true)
                index += 2
            }
        }
        search(curArr, cnt+1)
    }
    search(arr, 1)
    
    return answer
}
