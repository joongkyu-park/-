/*
 내가 생각하지 못했던 반례 : https://deok2kim.tistory.com/118
 -> 즉 이게 DFS 문제인거. 여러 조건문을 더덕더덕 붙여서 특정경로를 찾으려고 하면 답이 안나오는 문제였고,
 DFS로 찾아야 했던 것이다.
 
 참고코드 : https://icksw.tistory.com/228
 */

import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    // 도착지를 기준으로 알파벳 순서로 정렬한다.
    let tickets = tickets.sorted { $0[1] < $1[1] }
    // 티켓의 사용여부를 기록
    var visited = [Bool](repeating: false, count: tickets.count)
    
    var result: [String] = []
    
    func dfs(start: String){
        if result.count == tickets.count {
            result.append(start)
            return
        }
        for i in 0..<tickets.count
        {
            if tickets[i][0] == start && !visited[i] {
                visited[i] = true
                result.append(start)
                
                dfs(start: tickets[i][1])
                
                // 정답을 구했다면 return
                if result.count == tickets.count + 1 { return }
                
                // 아니라면 경로제거
                result.removeLast()
                visited[i] = false
            }
        }
    }
    
    // 시작은 항상 "ICN"이라고 문제에서 주어짐
    dfs(start: "ICN")
    
    return result
}


/*
 DFS로 풀지 않고 여러 조건문에 의해 1가지 경로를 찾으려고 했던 코드.
 */
import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    
    var tempSet = Set<String>()
    
    for ticket in tickets {
        tempSet.insert(ticket[0])
        tempSet.insert(ticket[1])
    }
    
    var ticketsArr = Array(tempSet)
    
    for i in 0..<ticketsArr.count {
        if ticketsArr[i] == "ICN" {
            let incheon = ticketsArr.remove(at: i)
            ticketsArr.sort()
            ticketsArr.insert(incheon, at: 0)
            break
        }
    }
    var ticketsList = [[String]] ()
    
    for i in 0..<ticketsArr.count {
        ticketsList.append([ticketsArr[i]])
    }
    
    for ticket in tickets {
        let start = ticket[0]
        var startIndex = -1
        let destiny = ticket[1]
        var destinyIndex = -1
        var flag = 0
        
        for i in 0..<ticketsArr.count {
            if ticketsArr[i] == start {
                startIndex = i
                flag += 1
            }
            if ticketsArr[i] == destiny {
                destinyIndex = i
                flag += 1
            }
            if flag == 2 { break }
        }
        ticketsList[startIndex].append(ticketsArr[destinyIndex])
        
    }
    
    for i in 0..<ticketsList.count {
        var start = ticketsList[i][0]
        
        ticketsList[i].remove(at: 0)
        
        ticketsList[i].sort()
        
        ticketsList[i].insert(start, at: 0)
    }
    
    var result = [String]()
    var ticketCounts = tickets.count
    var startIndex = 0
    
    result.append(ticketsArr[startIndex])
    
    while ticketCounts > 0 {
        var destinyIndex = 0
        var flag = 0
        while true {
            destinyIndex += 1
            
            let destiny = ticketsList[startIndex][destinyIndex]
            
            if ticketsList[startIndex].count == 2 {
                break
            }
            else {
                for i in 0..<ticketsList.count {
                    if ticketsList[i][0] == destiny  {
                        if ticketsList[i].count > 1 {
                            flag = 1
                            break
                        }
                        else {
                            break
                        }
                    }
                }
                if flag == 1 { break }
            }
        }
        let destiny = ticketsList[startIndex][destinyIndex]
        result.append(destiny)
        ticketsList[startIndex].remove(at: destinyIndex)
        
        var index = -1
        for i in 0..<ticketsList.count {
            if ticketsList[i][0] == destiny  {
                index = i
                startIndex = i
                break
            }
        }
        ticketCounts -= 1
    }
    
    return result
}
