import Foundation

func solution(_ record:[String]) -> [String] {
    var nicknameDic = [String: String]() //userId: nickname
    
    var message = [(String, String)]() //userId, enter or leave
    var result = [String]()
    
    for i in 0..<record.count {
        
        let recordArr = record[i].split(separator: " ").map{String($0)}
        let userId = recordArr[1]
        
        if recordArr[0] == "Enter" {
            nicknameDic[userId] = recordArr[2]
            message.append((userId, recordArr[0]))
        }
        else if recordArr[0] == "Leave" {
            message.append((userId, recordArr[0]))
        }
        else if recordArr[0] == "Change" {
            nicknameDic[userId] = recordArr[2]
        }
        
    }
    
    for i in 0..<message.count {
        if message[i].1 == "Enter" {
            result.append("\(nicknameDic[message[i].0]!)님이 들어왔습니다.")
        }
        else if message[i].1 == "Leave" {
            result.append("\(nicknameDic[message[i].0]!)님이 나갔습니다.")
        }
    }
    return result
}
