import Foundation

var dwarf = [Int](repeating: 0, count: 9)
for i in  0...8 {
    let n = Int(readLine()!)!
    dwarf[i] = n
}

dwarf.sort()
var result = [Int]()
var flag = 0
for i in 0..<dwarf.count {
    for j in 0..<dwarf.count {
        if i == j {continue}
        var sum = 0
        for k in 0..<dwarf.count{
            if k == i || k == j {continue}
            sum += dwarf[k]
        }
        if sum == 100 {
            for k in 0..<dwarf.count{
                if k == i || k == j {continue}
                result.append(dwarf[k])
            }
            flag = 1
            break
        }
    }
    if flag == 1 {break}
}
for i in 0..<result.count{
    print(result[i])
}
