import Foundation
import SwiftData

@Model
class RMData {
//    var id: UUID
    var weight: String
    var reps: String
    var exercise: String
    var oneRepMax: String
    var date: String
    var datetime: String

    init(/*id: UUID,*/ weight: String, reps: String, exercise: String, oneRepMax: String, date: String, datetime: String) {
//        self.id = id
        self.weight = weight
        self.reps = reps
        self.exercise = exercise
        self.oneRepMax = oneRepMax
        self.date = date
        self.datetime = datetime
    }
}
