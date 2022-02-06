import Foundation

func solution(_ n:Int, _ info:[Int]) -> [Int] {
    var lion = Array(repeating: 0, count: 11)
    var minIndex = -1
    var result = [Int]()
    var appeachScore = 0
    var lionScore = 0
    var gap = 0
    var flag = false
    
    func dfs(_ index: Int, _ cnt: Int ) {
        if lion[0]==1 && lion[1] == 1 && lion[2] == 1 && lion[3] == 1 && lion[4] == 1 && lion[5] == 1
            && lion[6] == 1 && lion[7] == 1{
            
        }
        if cnt == n
            || index == 10{
            for i in 0...10 {
                if info[i] == 0 && lion[i] == 0 {
                    continue
                }
                else if info[i] >= lion[i] {
                    appeachScore += (10-i)
                } else {
                    lionScore += (10-i)
                }
            }
            if lionScore > appeachScore{
                flag = true
                lion[10] += (n-cnt)
                if (lionScore - appeachScore) > gap {
                    gap = lionScore - appeachScore
                    result = lion
                }
                else if (lionScore - appeachScore) ==  gap {
                    for i in (0...10).reversed() {
                        if lion[i] > result[i] {
                            result = lion
                            break
                        }
                        else if lion[i] < result[i] {
                            break
                        }
                        else {
                            continue
                        }
                    }
                }
                lion[10] -= (n-cnt)
            }
            appeachScore = 0
            lionScore = 0
            return
        }
        
        for i in index+1...10 {
            if n-cnt > info[i]{
                lion[i] += info[i]+1
                dfs(i, cnt+info[i]+1)
                lion[i] -= info[i]+1
            }
            else if i == 10 {
                dfs(i, cnt)
            }
        }
    }
    
    for i in 0...10 {
        minIndex = i
        if n > info[i] {
            lion[i] += info[i]+1
            dfs(i, info[i]+1)
            lion[i] -= info[i]+1
        }
    }
    
    
    if flag{
        return result
    } else{
        return [-1]
    }
}
