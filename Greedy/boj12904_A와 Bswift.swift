import Foundation

let s = Array(readLine()!).map{String($0)}
var t = Array(readLine()!).map{String($0)}

while t.count > s.count{
    if t[t.count-1] == "A"{
        t.removeLast()
    }
    else {
        t.removeLast()
        t.reverse()
    }
}

if s == t{
    print(1)
}
else {
    print(0)
}
