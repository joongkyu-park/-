// https://nsios.tistory.com/91

func solution(_ lines:[String]) -> Int {
    var time = [(Int,Int)]()
    
    for i in 0..<lines.count {
        let line = lines[i]
        let timeArr = line.split(separator: " ").map{String($0)}[1].split(separator: ":").map{Double(String($0))!}
        let endTime = Int((timeArr[0]*60*60 + timeArr[1]*60 + timeArr[2])*1000)
        let processingTime = line.split(separator: " ").map{String($0)}[2]
        let startIndex = processingTime.startIndex
        let endIndex = processingTime.index(processingTime.startIndex, offsetBy: processingTime.count-2)
        
        let gap = Int(Double(String(processingTime[startIndex...endIndex]))!*1000)
        
        let startTime = endTime - gap + 1
        
        time.append((startTime,endTime))
    }
    
    
    var result = 0
    for i in 0..<time.count {
        if i == 1{
            
        }
        var tmpResult = 1
        for j in i+1..<time.count {
            
            if time[i].1+1000 > time[j].0 {
                tmpResult += 1
            }
            
        }
        if tmpResult > result {
            result = tmpResult
        }
    }
    return result
}
