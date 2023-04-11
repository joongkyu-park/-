let mkString = Array(readLine()!).map { String($0) }
let n = mkString.count

var maxValue = ""
var minValue = ""

var forMaxValue = "1"
var forMinValue = "1"
var wasM = false
for i in 0..<n {
    let element = mkString[i]
    
    // for maxValue
    if element == "M" {
        forMaxValue += "0"
    }
    else if element == "K" {
        forMaxValue.replaceSubrange(forMaxValue.startIndex...forMaxValue.startIndex, with: "5")
        maxValue += String(forMaxValue)
        forMaxValue = "1"
    }
    
    // for minValue
    if element == "M" {
        forMinValue += "0"
        wasM = true
    }
    else if element == "K" {
        if false == wasM {
            minValue += "5"
            continue
        }
        forMinValue.removeLast()
        minValue += String(forMinValue)
        minValue += "5"
        forMinValue = "1"
        wasM = false
    }
}

if mkString[n-1] == "M" {
    forMaxValue.removeLast()
    for _ in 0..<String(forMaxValue).count {
        maxValue += "1"
    }
}

if mkString[n-1] == "M" {
    forMinValue.removeLast()
    minValue += String(forMinValue)
}

print(maxValue)
print(minValue)
