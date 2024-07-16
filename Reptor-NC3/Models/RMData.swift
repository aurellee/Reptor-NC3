import Foundation
import SwiftData

@Model
class RMData {
    var weight: String = ""
    var reps: String = ""
    var exercise: String = "None"
    var oneRepMax: String = "0"
    var exercises: [Exercise] = []
    var date: String = ""

    init(weight: String, reps: String, exercise: String, oneRepMax: String, exercises: [Exercise], date: String) {
        self.weight = weight
        self.reps = reps
        self.exercise = exercise
        self.oneRepMax = oneRepMax
        self.exercises = exercises
        self.date = date
    }
}
