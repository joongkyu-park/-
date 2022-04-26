/*
무식하게 5중 배열을 만든 코드.
 정확성은 다 맞았지만 효율성 0점
 
import Foundation

func solution(_ info:[String], _ query:[String]) -> [Int] {
    
    var tree = Array(repeating: Array(repeating: Array(repeating: (Array(repeating: [Int](), count: 2)), count: 2), count: 2), count: 3)
    
    for person in info {
        let personArr = person.split(separator: " ").map{String($0)}
        var indice = [-1,-1,-1,-1,-1]
        
        if personArr[0] == "java" {
            indice[0] = 0
        }
        else if personArr[0] == "python" {
            indice[0] = 1
        }
        else if personArr[0] == "cpp" {
            indice[0] = 2
        }
        
        if personArr[1] == "frontend" {
            indice[1] = 0
        }
        else if personArr[1] == "backend" {
            indice[1] = 1
        }
        
        if personArr[2] == "junior" {
            indice[2] = 0
        }
        else if personArr[2] == "senior" {
            indice[2] = 1
        }
        
        if personArr[3] == "pizza" {
            indice[3] = 0
        }
        else if personArr[3] == "chicken" {
            indice[3] = 1
        }
        
        indice[4] = Int(personArr[4])!
        
        tree[indice[0]][indice[1]][indice[2]][indice[3]].append(indice[4])
    }
    
    var result = Array(repeating: 0, count: query.count)
    for (index, q) in query.enumerated() {
        let queryArr = q.split(separator: " ").map{String($0)}
        
        var indice0 = [Int]()
        var indice1 = [Int]()
        var indice2 = [Int]()
        var indice3 = [Int]()
        var score: Int = -1
        
        if queryArr[0] == "java" {
            indice0.append(0)
        }
        else if queryArr[0] == "python" {
            indice0.append(1)
        }
        else if queryArr[0] == "cpp" {
            indice0.append(2)
        }
        else {
            indice0.append(0)
            indice0.append(1)
            indice0.append(2)
        }
        
        if queryArr[2] == "frontend" {
            indice1.append(0)
        }
        else if queryArr[2] == "backend" {
            indice1.append(1)
        }
        else {
            indice1.append(0)
            indice1.append(1)
        }
        
        if queryArr[4] == "junior" {
            indice2.append(0)
        }
        else if queryArr[4] == "senior" {
            indice2.append(1)
        }
        else {
            indice2.append(0)
            indice2.append(1)
        }
        
        if queryArr[6] == "pizza" {
            indice3.append(0)
        }
        else if queryArr[6] == "chicken" {
            indice3.append(1)
        }
        else {
            indice3.append(0)
            indice3.append(1)
        }
        score = Int(queryArr[7])!
        
        for i in indice0 {
            for j in indice1 {
                for k in indice2 {
                    for l in indice3 {
                        for s in tree[i][j][k][l] {
                            if s >= score {
                                result[index] += 1
                            }
                        }
                    }
                }
            }
        }
    }

    return result
}
*/

// 참고 : https://velog.io/@sainkr/%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%A8%B8%EC%8A%A4-%EC%88%9C%EC%9C%84-%EA%B2%80%EC%83%89-Swift

import Foundation

func solution(_ info:[String], _ query:[String]) -> [Int] {
    
    var db = [String: [Int]]()
    var result = [Int]()
    
    for i in info {
        let arr = i.split(separator: " ").map{String($0)}
        
        for language in ["-", arr[0]] {
            for position in ["-", arr[1]] {
                for career in ["-", arr[2]] {
                    for food in ["-", arr[3]] {
                        if db["\(language)\(position)\(career)\(food)"] == nil {
                            db["\(language)\(position)\(career)\(food)"] = [Int(arr[4])!]
                        }
                        else {
                            db["\(language)\(position)\(career)\(food)"]!.append(Int(arr[4])!)
                        }
                    }
                }
            }
        }
    }
    
    for data in db {
        db[data.key]!.sort()
    }
    
    for q in query {
        let arr = q.split(separator: " ").map{String($0)}
        let key = arr[0]+arr[2]+arr[4]+arr[6]
        let score = Int(arr[7])!
        
        if let scoreArr = db[key]{
            // 이진 탐색
            var low = 0
            var high = scoreArr.count - 1
            var mid = 0
            
            while low <= high {
                mid = (low + high) / 2
                if scoreArr[mid] < score {
                    low = mid + 1
                } else {
                    high = mid - 1
                }
            }
            result.append(scoreArr.count - low)
        } else{
            result.append(0)
        }
    }
    
    return result
}
