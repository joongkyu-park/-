import Foundation

func solution(_ name:String) -> Int {
    var freq =  [Int]()
    
    func joystick(result: inout Int, name: String, cmpName: inout String, index: inout Int) {
        if name[name.index(name.startIndex, offsetBy: index)] ==
            cmpName[cmpName.index(cmpName.startIndex, offsetBy: index)]{
            result += 0
        }
        else{
            result += freq[index]
            let tmp = [name[name.index(name.startIndex, offsetBy: index)]]
            cmpName.replaceSubrange(cmpName.index(cmpName.startIndex, offsetBy: index) ..< cmpName.index(cmpName.startIndex, offsetBy: index+1), with: tmp)
        }
        var leftIndex: Int = index - 1
        var rightIndex: Int = index + 1
        while true{
            if name == cmpName {break}
            
            result += 1
            if leftIndex < 0 {
                leftIndex = name.count-1
            }
            if rightIndex >= name.count {
                rightIndex = 0
            }
            
            if name[name.index(name.startIndex, offsetBy: leftIndex)] !=
                cmpName[cmpName.index(cmpName.startIndex, offsetBy: leftIndex)] {
                index = leftIndex
                break
            }
            else if name[name.index(name.startIndex, offsetBy: rightIndex)] !=
                        cmpName[cmpName.index(cmpName.startIndex, offsetBy: rightIndex)] {
                index = rightIndex
                break
            }
            else {
                leftIndex -= 1
                rightIndex += 1
            }
        }
    }
    
    var cmpName: String = ""
    for _ in 0 ..< name.count {
        cmpName += "A"
    }
    
    for char in name {
        let charA: Character = "A"
        var def: Int = Int(char.asciiValue!) - Int(charA.asciiValue!)
        if def > 13 {
            def = 26 - (Int(char.asciiValue!) - Int(charA.asciiValue!))
        }
        freq.append(def)
    }
    
    var result: Int = 0
    var index: Int = 0
    while true {
        if name == cmpName {break}
        joystick(result: &result, name: name, cmpName: &cmpName, index: &index)
    }
    return result
}
