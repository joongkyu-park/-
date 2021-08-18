import Foundation

func solution(_ jobs:[[Int]]) -> Int {
var jobs = jobs
jobs.sort(by: {$0[0] < $1[0]})

var waiting = [Int](repeating: 0, count: jobs.count)
var visited = [Int](repeating: 0, count: jobs.count)

var start: [Int] = jobs[0]


var index: Int = 0

for i in 0..<jobs.count {
    if jobs[i][0] == start[0] {
        if start[1] > jobs[i][1]{
            start = jobs[i]
            index = i
        }
    }
    else {break}
}

var time: Int = start[0]
var taken: Int = 2147483647
var count = 0

while true {
    
    time += jobs[index][1]
    waiting[index] += abs(time - jobs[index][0])
    visited[index] = 1
     
    count += 1
    if count == jobs.count {break}
    
    taken = 2147483647
    var flag = 0
    for i in 0..<jobs.count {
        if jobs[i][0] <= time{
            if taken > jobs[i][1] && visited[i] == 0 {
                taken = jobs[i][1]
                index = i
                flag = 1
            }
        }
        else {break}
    }
    if flag == 0 {
        index = index + 1
        start = jobs[index]
        for i in index+1..<jobs.count{
            if jobs[i][0] != start[0] {break}
            else {
                if jobs[i][1] < start[1] {
                    start = jobs[i]
                    index = i
                }
            }
        }
        time += start[0] - time
    }
}

var result: Int = 0
for t in waiting {
    result += t
}
result = result/jobs.count

return result

}
