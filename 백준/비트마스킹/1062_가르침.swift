/*
아래는 일반적인 dfs 풀이.
시간 관점에서 비트마스킹 풀이랑의 가장 큰 차이점은
 if count == k 일 때의 로직.
 비트마스킹은 각 단어 당 check과 비트마스크 한 번하면 확인 끝.
 일반적인 dfs 풀이는 각 단어를 캐릭터별로 순회해야함.
 
 아래는 시간초과 났던 dfs 풀이(그러나 c++같은 언어에서는 통과된다고 함.)
 
 let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
 let n = nk[0]
 var k = nk[1]

 var words = Array<String>()
 for _ in 0..<n {
     let word = readLine()!
     words.append(word)
 }

 if k < 5 {
     print(0)
 }
 else {
     var answer = 0
     var check = Array(repeating: false, count: 26)
     check[Int(UnicodeScalar("a").value) - Int(UnicodeScalar("a").value)] = true
     check[Int(UnicodeScalar("n").value) - Int(UnicodeScalar("a").value)] = true
     check[Int(UnicodeScalar("i").value) - Int(UnicodeScalar("a").value)] = true
     check[Int(UnicodeScalar("c").value) - Int(UnicodeScalar("a").value)] = true
     check[Int(UnicodeScalar("t").value) - Int(UnicodeScalar("a").value)] = true
     k -= 5
     
     dfs(0, 0)
     func dfs(_ index: Int, _ count: Int) {
         if count == k {
             var result = 0
             outer: for word in words {
                 for char in Array(word).map({ String($0) }) {
                     if false == check[Int(UnicodeScalar(char)!.value)  - Int(UnicodeScalar("a").value)] {
                         continue outer
                     }
                 }
                 result += 1
             }
             answer = max(answer, result)
             return
         }
         
         if index >= 26 {
             return
         }
         
         for i in index..<26 {
             if false == check[i] {
                 check[i] = true
                 dfs(i, count + 1)
                 check[i] = false
             }
         }
     }
     
     print(answer)
     
 }
 */

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nk[0]
var k = nk[1]

var words = Array(repeating: 0, count: n)
for i in 0..<n {
    let word = readLine()!
    for char in word {
        words[i] |= 1 << (Int(char.asciiValue! - Character("a").asciiValue!))
    }
}
if k < 5 {
    print(0)
}
else {
    var answer = 0
    var check = 0
    check |= 1 << (Character("a").asciiValue! - Character("a").asciiValue!)
    check |= 1 << (Character("n").asciiValue! - Character("a").asciiValue!)
    check |= 1 << (Character("i").asciiValue! - Character("a").asciiValue!)
    check |= 1 << (Character("c").asciiValue! - Character("a").asciiValue!)
    check |= 1 << (Character("t").asciiValue! - Character("a").asciiValue!)
    
    k -= 5
    
    dfs(0, 0)
    func dfs(_ index: Int, _ count: Int) {
        if count == k {
            var result = 0
            outer: for word in words {
                if (check & word) != word {
                    continue outer
                }
                result += 1
            }
            answer = max(answer, result)
            return
        }
        
        if index >= 26 {
            return
        }
        
        for i in index..<26 {
            if (check & (1 << i)) == 0 {
                check |= 1 << i
                dfs(i, count + 1)
                check &= ~(1 << i)
            }
        }
    }
    
    print(answer)
    
}
