import Foundation

let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nm[0]
let m = nm[1]

if n==1 || m==1{
    print(1)
}
else if n==2 {
    if m == 2{
        print(1)
    }
    else if m==3 || m==4{
        print(2)
    }
    else if m==5 || m==6{
        print(3)
    }
    else {
        print(4)
    }
}
else {
    if m==2{
        print(2)
    }
    else if m==3 {
        print(3)
    }
    else if m>=4 && m<=6 {
        print(4)
    }
    else {
        let cnt = m-2
        print(cnt)
    }
}
