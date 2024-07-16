import Foundation
import SwiftData

@Model
class RMData {
    var weight: String
    var reps: String
    var exercise: String
    var oneRepMax: String
    var date: String

    init(weight: String, reps: String, exercise: String, oneRepMax: String, date: String) {
        self.weight = weight
        self.reps = reps
        self.exercise = exercise
        self.oneRepMax = oneRepMax
        self.date = date
    }
}
