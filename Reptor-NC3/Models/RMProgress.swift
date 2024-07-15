import Foundation
import SwiftUI

class RMProgress {
    // 1RM Calculator
    let e = 2.71828182845904
    var weights = 80
    var rep = 12
    
    var oneRepMax: Int {
        let weightPercent = 100 * weights
        let b = 48.8 + (53.8 * pow(e,-0.075*Double(rep)))
        
        return Int(Double(weightPercent)/b)
    }
    
    // Workout Plan All
    let repArray = [1...12]
    let percentArray = [100, 96, 92, 89, 86, 84, 81, 79, 76, 74, 71, 68]
    var weightArray : [Int] {
        var repWeight: [Int] = []
        for i in percentArray{
            repWeight.append(Int(weights*i))
        }
        return repWeight
    }
}

