import Foundation

var input = readLine()!.split(separator: " ").map{Int($0)!}
let L = input[0]
let C = input[1]
var chars = readLine()!.split(separator: " ").map{String($0)}
chars.sort()
var vowel = ["a", "e", "i", "o", "u"]
var vowelCnt = 0
var consonantCnt = 0
var visited = [Int](repeating: 0, count: chars.count)
var result = [String](repeating: "", count: L)

func dfs(_ cnt: Int, _ s: Int){
    if cnt == L {
        if vowelCnt >= 1 && consonantCnt >= 2{
            for i in 0..<L{
                print(result[i],terminator: "")
            }
            print()
            return
        }
        else {
            return
        }
    }
    
    for i in s..<C{
        if visited[i] == 0{
            visited[i] = 1
            if vowel.contains(chars[i]) {
                vowelCnt += 1
            }
            else {
                consonantCnt += 1
            }
            result[cnt] = chars[i]
            dfs(cnt+1, i+1)
            visited[i] = 0
            if vowel.contains(chars[i]) {
                vowelCnt -= 1
            }
            else {
                consonantCnt -= 1
            }
        }
    }
}

dfs(0, 0)
