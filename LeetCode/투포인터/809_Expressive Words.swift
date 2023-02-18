class Solution {

    func expressiveWords(_ s: String, _ words: [String]) -> Int {

        let s = Array(s).map { String($0) }
        var charCountTuples = [(String, Int)]()
        var curChar = s[0]
        var curCharCount = 1
        if s.count == 1 {
            charCountTuples.append((curChar, curCharCount))
        }
        else {
            for i in 1..<s.count {
                if curChar == s[i] {
                    curCharCount += 1
                }
                else {
                    charCountTuples.append((curChar, curCharCount))
                    curChar = s[i]
                    curCharCount = 1
                }
            }
            charCountTuples.append((curChar, curCharCount))
        }

        var answer = 0
        outer: for i in 0..<words.count {
            let word = Array(words[i]).map { String($0) }
            var charCountTuplesForWord = [(String, Int)]()
            var curCharForWord = word[0]
            var curCharCountForWord = 1
            if word.count == 1 {
                charCountTuples.append((curCharForWord, curCharCountForWord))
            }
            else {
                for i in 1..<word.count {
                    if curCharForWord == word[i] {
                        curCharCountForWord += 1
                    }
                    else {
                        charCountTuplesForWord.append((curCharForWord, curCharCountForWord))
                        curCharForWord = word[i]
                        curCharCountForWord = 1
                    }
                }
                charCountTuplesForWord.append((curCharForWord, curCharCountForWord))
            }

            if charCountTuplesForWord.count > charCountTuples.count {
                continue
            }
            for sIndex in 0..<charCountTuples.count {
                if sIndex >= charCountTuplesForWord.count {
                    continue outer
                }
                if charCountTuples[sIndex].0 != charCountTuplesForWord[sIndex].0 {
                    continue outer
                }
                if charCountTuples[sIndex].1 < charCountTuplesForWord[sIndex].1 {
                    continue outer
                }
                if charCountTuples[sIndex].1 > charCountTuplesForWord[sIndex].1 {
                    if charCountTuples[sIndex].1 < 3 {
                        continue outer
                    }
                }
            }
            answer += 1
        }
        return answer
    }

}
