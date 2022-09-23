/*
 https://www.youtube.com/watch?v=rJ3RkRfaSKY
 */
import Foundation

func solution(_ alp:Int, _ cop:Int, _ problems:[[Int]]) -> Int {
    var maxAlp = 0
    var maxCop = 0

    for problem in problems {
        if problem[0] > maxAlp {
            maxAlp = problem[0]
        }
        if problem[1] > maxCop {
            maxCop = problem[1]
        }
    }
    
    if (alp >= maxAlp) && (cop >= maxCop) {
        return 0
    }
    
    maxAlp = max(maxAlp, alp)
    maxCop = max(maxCop, cop)
    
    var problems = problems
    problems.append([0,0,1,0,1])
    problems.append([0,0,0,1,1])
    
    var dp = Array(repeating: Array(repeating: Int.max, count: maxCop+1), count: maxAlp+1)
    dp[alp][cop] = 0
    for cur_alp in alp...maxAlp {
        for cur_cop in cop...maxCop {
            for problem in problems {
                if (cur_alp < problem[0]) || (cur_cop < problem[1]) { continue }
                var new_alp = cur_alp + problem[2]
                var new_cop = cur_cop + problem[3]
                if new_alp > maxAlp { new_alp = maxAlp }
                if new_cop > maxCop { new_cop = maxCop }
                dp[new_alp][new_cop] = min(dp[new_alp][new_cop], dp[cur_alp][cur_cop] + problem[4])
            }
        }
    }
    return dp[maxAlp][maxCop]
}
