/*
 처음에 논리는 dfs로 brute force하는 논리는 맞았으나 시간초과
 이유 : N=9일 때 0000000000부터 999999999부터 전체를 탐색하게되면 시간초과.

 그런데 문제는 min값, max값만 찾으면되니까 함수 2번실행.
 순방향대로 탐색하다 최초값 찾으면, 함수 전체종료(순방향으로 탐색하다 찾은 처음 값이 최소값이니까)
 역방향대로 탐색하다 최초값 찾으면, 함수 전체종료(역방향으로 탐색하다 찾은 처음 값이 최대값이니까)
 
 이렇게 탐색을 확 줄일 수 있다.
 */
import Foundation

var N = Int(readLine()!)!
var input = readLine()!.split(separator: " ").map{String($0)}

var visited = [Int](repeating: 0, count: 10)
var arr = [Int](repeating: 0, count: N+1)
var maxResult = "0000000000"
var minResult = "9999999999"
func dfs(_ cnt: Int, _ direction: Int) -> Int{
    if cnt == N+1{
        var str = ""
        var flag = 0
        for i in 0..<N{
            if input[i] == "<"{
                if (arr[i] < arr[i+1]) == true{
                    str += String(arr[i])
                    continue
                }
                else{
                    flag = 1
                    break
                }
            }
            else {
                if (arr[i] > arr[i+1]) == true{
                    str += String(arr[i])
                    continue
                }
                else{
                    flag = 1
                    break
                }
            }
        }
        if flag == 0 {
            str += String(arr[N])
            if direction == 0 {
                if str < minResult{
                    minResult = str
                    return 0
                }
            }
            else if direction == 1{
                if str > maxResult{
                    maxResult = str
                    return 1
                }
            }
        }
        else {
            return -1
        }
        
    }
    if direction == 0{
        for i in 0...9{
            if visited[i] == 0{
                visited[i] = 1
                arr[cnt] = i
                var tmp = dfs(cnt+1, direction)
                if tmp == 0{
                    return 0
                }
                else{
                    visited[i] = 0
                }
            }
        }
    }
    else {
        for i in (0...9).reversed(){
            if visited[i] == 0{
                visited[i] = 1
                arr[cnt] = i
                var tmp = dfs(cnt+1, direction)
                if tmp == 1{
                    return 1
                }
                else{
                    visited[i] = 0
                }
            }
        }
    }
    
    
    return -1
}

dfs(0, 0)
for i in 0..<visited.count{
    visited[i] = 0
}
dfs(0, 1)

print(maxResult)
print(minResult)
