import Foundation
import Combine
import SwiftData

@MainActor
class SavedPlanViewModel: ObservableObject {
    func uniqueExercises(_ data: [RMData]) -> [RMData] {
        var seen = Set<String>()
        return data.filter { exerciseData in
            guard !seen.contains(exerciseData.exercise) else { return false }
            seen.insert(exerciseData.exercise)
            return true
        }
    }
}
