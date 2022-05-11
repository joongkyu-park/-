/*
 중간에 잘못 이해해서 visited를 썼다가 ban_count로 바꿈
 visited를 쓰면 더 간략하게 구현가능
 */
import Foundation

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {

    var candidate_arr = Array(repeating: [Int](), count: user_id.count)

    var ban_set = Set<String>()
    for ban in banned_id{
        ban_set.insert(ban)
    }
    let ban_kind_arr = Array(ban_set)
    var ban_count = Array(repeating: 0, count: ban_kind_arr.count)
    for i in 0..<banned_id.count {
        for j in 0..<ban_count.count {
            if banned_id[i] == ban_kind_arr[j] {
                ban_count[j] += 1
            }
        }
    }

    for(b, ban) in ban_kind_arr.enumerated() {
        var star_indice = [Int]()
        let ban_arr = Array(ban).map{String($0)}
        for i in 0..<ban_arr.count {
            if ban_arr[i] == "*"{
                star_indice.append(i)
            }
        }
        for (u, user) in user_id.enumerated() {
            if ban.count == user.count {
                var user_arr = Array(user).map{String($0)}
                for index in star_indice {
                    user_arr[index] = "*"
                }
                var user_str = ""
                for i in 0..<user_arr.count {
                    user_str += user_arr[i]
                }
                if user_str == ban {
                    candidate_arr[u].append(b)
                }
            }

        }
    }
    
    var answer_set = Set<[Int]>()

    func check(_ index: Int, _ cnt: Int, _ arr: [Int]) {
        if cnt == banned_id.count {
            var answer_arr = arr
            answer_arr.sort()
            answer_set.insert(answer_arr)
            return
        }

        for cur_index in index..<candidate_arr.count {
            for candidate in candidate_arr[cur_index] {
                if ban_count[candidate] > 0 {
                    ban_count[candidate] -= 1
                    var new_arr = arr
                    new_arr.append(cur_index)
                    check(cur_index+1, cnt+1, new_arr)
                    ban_count[candidate] += 1
                }
            }
        }
    }

    for i in 0..<candidate_arr.count {
        for candidate in candidate_arr[i] {
            if ban_count[candidate] > 0 {
                ban_count[candidate] -= 1
                check(i+1, 1, [i])
                ban_count[candidate] += 1
            }
        }
    }

    return answer_set.count
}
