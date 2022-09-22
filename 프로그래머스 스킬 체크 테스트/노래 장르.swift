import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var genresSet = Set<String>()
    genres.forEach {
        genresSet.insert($0)
    }
    let genresArr = Array(genresSet)
    var genresIndiceMap = [String: Int]()
    for (i, genre) in genresArr.enumerated() {
        genresIndiceMap[genre] = i
    }
    var genresPlayCount = Array(repeating: 0, count: genresArr.count)
    for (i, genre) in genres.enumerated() {
        let genreIndex = genresIndiceMap[genre]!
        genresPlayCount[genreIndex] += plays[i]
    }
    var genresRank =  [(Int, Int)]() // (index, playCount)
    for (i, playCount) in genresPlayCount.enumerated() {
        genresRank.append((i,playCount))
    }
    genresRank.sort { $0.1 > $1.1 }
    
    var musicByGenres = Array(repeating: [(Int, Int)](), count: genresArr.count) // [(id, playCount), (id, playCount), ...]
    for (i, genre) in genres.enumerated() {
        let genreIndex = genresIndiceMap[genre]!
        musicByGenres[genreIndex].append((i, plays[i]))
    }
    
    for i in 0..<musicByGenres.count {
        musicByGenres[i].sort{$0.1 > $1.1}
    }
    
    var answer = [Int]()
    for rank in genresRank {
        let genrenIndex = rank.0
        if musicByGenres[genrenIndex].count == 1 {
            answer.append(musicByGenres[genrenIndex].first!.0)
        }
        else {
            answer.append(musicByGenres[genrenIndex][0].0)
            answer.append(musicByGenres[genrenIndex][1].0)
        }
    }
    
    
    return answer
}
