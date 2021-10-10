import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}

let N = input[0]
let M = input[1]

/*
시간 초과 -> 매 print 상황마다 for문으로 출력하는거 자체가 시간소요..!
print 호출은 가급적 1번만!
 
var arr = [Int](repeating: -1, count: M)
func dfs(_ cnt: Int){
    if cnt == M {
        for i in 0..<M{
            print(arr[i], terminator: " ")
        }
        print()
        return
    }
    
    for i in 1...N {
        arr[cnt] = i
        dfs(cnt+1)
    }
}
dfs(0)
*/
var result = ""
func dfs(_ cnt: Int,_ sequence: String){
    
    if cnt == M {
        result += "\(sequence)\n"
        return
    }
    
    for i in 1...N {
        dfs(cnt+1,sequence + "\(i) ")
    }
}

dfs(0,"")
print(result)
