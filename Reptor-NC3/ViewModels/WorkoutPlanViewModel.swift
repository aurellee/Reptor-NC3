import Foundation
import Combine
import SwiftData

@MainActor
class WorkoutPlanViewModel: ObservableObject {
    // All Workout Plan
    let repArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    let percentArray = [100, 96, 92, 89, 86, 84, 81, 79, 76, 74, 71, 68]
    var weightArray : [String] = []
    var tempWeight: Double = 0
    
    // Weight Percentages Calculation
    func calulateWeights(oneRepMax: String) -> [String] {
        for index in 1..<12 {
            tempWeight = Double(percentArray[index]) * (Double(oneRepMax) ?? 0)
            weightArray.append(String(format: "%.0f", tempWeight))
        }
        return weightArray
    }
    
    // Weight Percentage Calculation
    var weightPercentage: Double = 0
    func calculateWeightPercentage(percent: Double, oneRepMax: String) -> String {
        weightPercentage = percent * (Double(oneRepMax) ?? 0)
        return String(format: "%.0f", weightPercentage)
    }
}
