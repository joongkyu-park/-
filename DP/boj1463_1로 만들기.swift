/*
 DP문제의 본질 - n번째의 값은 이전 번째들의 값으로 부터 얻을 수 있다. ex)피보나치 : f(n) = f(n-1) + f(n-2)
 -> 이전번째들로 n번째를 얻을 수 있다는 것이 핵심. 이 관계를 찾아내는 것이 점화식
 
 이 문제에서도,
 1 -> 이미 1 이므로 0이 출력
 2 -> 2 / 2 = 1 -> 1 출력
 3 -> 3 / 3 = 1 -> 1 출력
 4 -> 4 / 2 = 2 / 2 = 1 -> 2 출력
 5 -> 5 - 1 = 4 / 2 = 2 / 2 = 1 -> 3 출력
 ...
 이런식으로 이전번째의 값으로 부터 현재번째의 값을 얻어내는 걸 알 수 있다.
 
 그다음.
 탑다운 vs. 바텀업
 탑다운 : n번째 값부터 접근. 메모이제이션을 통해 구함. 탈출조건은 대게 n=0, n=1, n=2 과 같은 초기값일때. 재귀로 구현
 바텀업 : 1번째부터 계산을 시작하여 n번째까지 반복문을 통해서 구함
 */
import Foundation

var n = Int(readLine()!)!
var dp = [Int](repeating: -1, count: n+1)
dp[1] = 0
if n>=2 {
    for i in 2...n {
        dp[i] = dp[i-1]+1
        if i % 2 == 0{
            dp[i] = min(dp[i], dp[i/2] + 1)
        }
        if i % 3 == 0{
            dp[i] = min(dp[i], dp[i/3] + 1)
        }
    }
}
print(n==1 ? 0 :dp[n])

// 완전 시간초과!
//import Foundation
//
//var n = Int(readLine()!)!
//var minCnt = -1
//
//func dp(_ num: Int, _ cnt: Int) {
//    if num == 1{
//        if cnt < minCnt || minCnt < 0{
//            minCnt = cnt
//            return
//        }
//        else {return}
//    }
//    else {
//        if num % 3 == 0 {
//            dp(num/3, cnt+1)
//        }
//        if num % 2 == 0 {
//            dp(num/2, cnt+1)
//        }
//        dp(num-1, cnt+1)
//    }
//}
//
//dp(n, 0)
//print(minCnt)
