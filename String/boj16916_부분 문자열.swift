/*
 KMP 코드 이해에 많은 도움을 준 사이트
 https://bowbowbow.tistory.com/6
 https://soobarkbar.tistory.com/80
 https://bblackscene21.tistory.com/2
 
 j = pi[j-1]인 이유
 https://blog.naver.com/PostView.nhn?blogId=kks227&logNo=220917078260&categoryNo=299&parentCategoryNo=0&viewDate=&currentPage=4&postListTopCurrentPage=&from=menu&userTopListOpen=true&userTopListCount=5&userTopListManageOpen=false&userTopListCurrentPage=4
 */
import Foundation

let s = Array(readLine()!)
let p = Array(readLine()!)

var pi = Array(repeating: 0, count: p.count)

getPi()

var answer = 0
var j = 0
for i in 0..<s.count {
    while j>0 && s[i] != p[j] {
        j = pi[j-1]
    }
    if s[i] == p[j] {
        if j == p.count-1 {
            answer = 1
            break
        } else { j += 1 }
        
    }
}
print(answer)


func getPi(){
    var j = 0
    for i in 1..<p.count {
        
        while (j > 0) && (p[i] != p[j]) {
            j = pi[j-1]
        }
        if p[i] == p[j] {
            j += 1
            pi[i] = j
        }
    }
}
