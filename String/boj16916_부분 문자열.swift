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
var j = 0 //패턴의 인덱스
for i in 0..<s.count {
    while j>0 && s[i] != p[j] { //매칭되지않는 부분 발견!
        j = pi[j-1] //나(j)바로 전까지의 pi값에 의하여 j의 인덱스 땡겨오기
    } //while문 쓰는이유 -> 땡겨오고나서 다시 p[j]랑 s[i]가 같은지 비교해야하니까! -> 다르면 다시 땡겨와야하니까
    
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
