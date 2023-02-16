class Solution {

    func checkStraightLine(_ coordinates: [[Int]]) -> Bool {

        if coordinates.count == 2 {
            return true
        }

        if coordinates[0][1] == coordinates[1][1] {
            for i in 1..<coordinates.count-1 {
                if coordinates[i][1] != coordinates[i+1][1] {
                    return false
                }
            }
        }
        else if coordinates[0][0] == coordinates[1][0] {
            for i in 1..<coordinates.count-1 {
                if coordinates[i][0] != coordinates[i+1][0] {
                    return false
                }
            }
        }
        else {
            let slope: Double = (Double(coordinates[0][1]) - Double(coordinates[1][1]))
            / (Double(coordinates[0][0]) - Double(coordinates[1][0]))

            for i in 1..<coordinates.count-1 {
                let curSlope = (Double(coordinates[i][1]) - Double(coordinates[i+1][1]))
            / (Double(coordinates[i][0]) - Double(coordinates[i+1][0]))

                if slope != curSlope {
                    return false
                }
            }
        }

        
        return true
    }

}
