import Foundation

while true {
    var input = readLine()!.split(separator: " ").map{Int($0)!}
    if input[0] == 0 {
        break
    }
    else {
        var k = input[0]
        var arr = [Int](repeating: 0, count: input.count-1)
        var resultArr = [Int](repeating: 0, count: 6)
        for i in 0..<input.count-1{
            arr[i] = input[i+1]
        }
        
        var visited = [Int](repeating: 0, count: arr.count)
        
        func dfs(_ cnt: Int, _ next: Int){
            if cnt == 6 {
               var str = ""
                for i in 0..<resultArr.count {
                    str += "\(resultArr[i]) "
                }
                print(str)
                return
            }
            
            for i in next..<arr.count{
                if visited[i] == 0 {
                    visited[i] = 1
                    resultArr[cnt] = arr[i]
                    dfs(cnt+1, i)
                    visited[i] = 0
                }
            }
        }
        dfs(0,0)
        print()
    }
}
