import Foundation

var n = Int(readLine()!)

if let n = n {
    for i in 0..<n {
        var a = readLine()

        if let a = a {
            var arr = a.components(separatedBy: " ")
            
            for i in arr {
                for j in i.reversed() {
                    print(j, terminator: "")
                }
                print(" ", terminator: "")
            }
            print("")
        }
    }
}
