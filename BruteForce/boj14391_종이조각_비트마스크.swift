/*
 아이디어 참고 : https://regularmember.tistory.com/90
 */
import Foundation

var input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0]
let m = input[1]

var paper = [String]()
for _ in 0..<n {
    let row = readLine()!
    paper.append(row)
}

var paperArr = paper.map{Array($0).map{String($0)}}
var max = 0

//0:가로로 자름, 1:세로로 자름
for b in 0..<(1<<(n*m)) {
    
    var sum = 0
    
    for r in 0..<n{
        var rowSum = 0
        for i in 0..<m{
            //k: 정사각형 종이 조각을 한줄로 이어 붙였을 때의 인덱스
            var k = r*m + i;
            
            //k번째 자리값이 0이다(가로로 자를거다)
            if ((b & (1 << k)) == 0) {
                rowSum = rowSum * 10 + Int(paperArr[r][i])!
            }
            else { //1인 경우(세로인 경우) 앞에까지 만들어진 조각을 sum에 더해준다.
                sum += rowSum;
                rowSum = 0;
            }
        }
        sum += rowSum;
    }
    for c in 0..<m{
        var columnSum = 0
        for i in 0..<n{
            var k = i*m + c;
            
            if ((b & (1 << k)) != 0) {
                columnSum = columnSum * 10 + Int(paperArr[i][c])!
            }
            else {
                sum += columnSum;
                columnSum = 0;
            }
        }
        sum += columnSum;
    }
    
    if sum > max{
        max = sum
    }
}

print(max)


