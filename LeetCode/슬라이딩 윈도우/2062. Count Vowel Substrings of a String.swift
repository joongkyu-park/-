class Solution {
    
    func countVowelSubstrings(_ word: String) -> Int {
        let n = word.count
        let word = word.map { String($0) }
        var vowelDict: [String: Int] = ["a": 0, "e": 0, "i": 0, "o": 0, "u": 0]
        var (j, k, vowel, cnt) = (0, 0, 0, 0)
        for i in 0..<n {
            let char = word[i]
            if let value = vowelDict[char] {
                vowelDict[char] = value + 1
                vowel += vowelDict[char] == 1 ? 1 : 0
                while vowel == 5 {
                    vowelDict[word[k]] = vowelDict[word[k]]! - 1
                    vowel -= (vowelDict[word[k]]) == 0 ? 1 : 0
                    k += 1
                }
                cnt += k - j
            } else {
                vowelDict = ["a": 0, "e": 0, "i": 0, "o": 0, "u": 0]
                vowel = 0
                j = i + 1
                k = i + 1
            }
        }
        return cnt
    }
    
}
