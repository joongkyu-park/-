let n = Int(readLine()!)!
var start = Array(readLine()!).map{Int(String($0))!}
let goal = Array(readLine()!).map{Int(String($0))!}

let reset = start
var answer = -1
var tmp = 0

//0번을 누를 경우
for i in 0..<n{
    if i != 0 && i != n-1{
        if start[i-1] != goal[i-1]{
            start[i-1] = abs(start[i-1]-1)
            start[i] = abs(start[i]-1)
            start[i+1] = abs(start[i+1]-1)
            
            tmp += 1
        }
    }
    else if i == 0{
        start[i] = abs(start[i]-1)
        start[i+1] = abs(start[i+1]-1)
        
        tmp += 1
    }
    else if i == n-1{
        if start[i-1] != goal[i-1]{
            start[i-1] = abs(start[i-1]-1)
            start[i] = abs(start[i]-1)
            
            tmp += 1
        }
    }
}
if start == goal{
    if answer == -1{
        answer = tmp
    }
    else {
        if tmp < answer{
            answer = tmp
        }
    }
}

tmp = 0
start = reset

//0번 스위치를 누르지 않을 경우
for i in 1..<n{
    if i != n-1{
        if start[i-1] != goal[i-1]{
            start[i-1] = abs(start[i-1]-1)
            start[i] = abs(start[i]-1)
            start[i+1] = abs(start[i+1]-1)
            
            tmp += 1
        }
    }
    else {
        if start[i-1] != goal[i-1]{
            start[i-1] = abs(start[i-1]-1)
            start[i] = abs(start[i]-1)
            
            tmp += 1
        }
    }
}
if start == goal{
    if answer == -1{
        answer = tmp
    }
    else {
        if tmp < answer{
            answer = tmp
        }
    }
}
print(answer)
