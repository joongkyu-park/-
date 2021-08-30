/*
 참고 : https://blog.naver.com/PostView.nhn?blogId=gustn3964&logNo=222136304942
 n번의 dfs(or bfs) 또는 플로이드-와샬 알고리즘
 */
import Foundation

func solution(_ n:Int, _ results:[[Int]]) -> Int {
    var matrix = [[Int]](repeating: (Array(repeating: 0, count: n+1)), count: n+1)
    var win = [Int](repeating: 0, count: n+1)
    var loose = [Int](repeating: 0, count: n+1)
    var check = [Int](repeating: 0, count: n+1)
    
    for result in results {
        matrix[result[0]][result[1]] = 1
    }
    
    func dfs(_ criteria: Int, _ num: Int){
        for i in 1...n {
            if matrix[num][i] == 1 && check[i] == 0{
                win[criteria] += 1
                loose[i] += 1
                check[i] = 1
                dfs(criteria, i)
            }
        }
        return
    }
    
    for i in 1...n{
        dfs(i, i)
        for j in 1...n{
            check[j] = 0
        }
    }
    
    var answer = 0
    for i in 1...n{
        if win[i] + loose[i] == n-1 {
            answer+=1
        }
    }
    return answer
}
