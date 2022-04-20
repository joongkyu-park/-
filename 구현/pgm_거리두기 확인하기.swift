import Foundation

func solution(_ places:[[String]]) -> [Int] {
    
    var result = [Int]()
    
    let dx = [0,1,2,-1,-2]
    let dy = [0,1,2,-1,-2]
    
    for place in places {
        var placeArr = [[String]]()
        for i in 0..<place.count {
            let tmpArr = Array(place[i]).map { String($0)}
            placeArr.append(tmpArr)
        }
        
        
        var isOk = 1
        
        outer: for i in 0..<5 {
            for j in 0..<5 {
                
                if placeArr[i][j] == "P" {
                    for a in 0..<dx.count {
                        for b in 0..<dy.count {
                            
                            if a == b && a == 0 {
                                continue
                            }
                            if (0..<5).contains(i+dx[a]) && (0..<5).contains(j+dy[b]) && abs(dx[a]) + abs(dy[b]) <= 2{
                                if placeArr[i+dx[a]][j+dy[b]] == "P" {
                                    if abs(dx[a]) + abs(dy[b]) == 1 {
                                        isOk = 0
                                        break outer
                                    }
                                    else if abs(dx[a]) + abs(dy[b]) == 2 {
                                        if dx[a] == 0 || dy[b] == 0 {
                                            var tmpDx = dx[a]
                                            var tmpDy = dy[b]
                                            
                                            if tmpDx < 0 {
                                                tmpDx += 1
                                            }
                                            else if tmpDx > 0 {
                                                tmpDx -= 1
                                            }
                                            if tmpDy < 0 {
                                                tmpDy += 1
                                            }
                                            else if tmpDy > 0 {
                                                tmpDy -= 1
                                            }
                                            
                                            if placeArr[i+tmpDx][j+tmpDy] != "X" {
                                                isOk = 0
                                                break outer
                                            }
                                        }
                                        
                                        else {
                                            if placeArr[i+dx[a]][j] != "X"
                                                || placeArr[i][j+dy[b]] != "X" {
                                                isOk = 0
                                                break outer
                                            }
                                        }
                                    }
                                }
                            }
                            
                        }
                    }
                }
            }
        }
        result.append(isOk)
    }
    
    return result
}
