let n = Int(readLine()!)!

var meeting = [[Int]]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    meeting.append(input)
}
meeting.sort{$0[0]<$1[0]}
meeting.sort{$0[1]<$1[1]}

var count = 1

var end = meeting[0][1]
for i in 1..<meeting.count{
    let curStart = meeting[i][0]
    let curEnd =  meeting[i][1]
    
    if curStart >= end {
        count += 1
        end = curEnd
    }
}

print(count)
