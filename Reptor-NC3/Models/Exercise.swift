//
//  ExerciseModel.swift
//  Reptor-NC3
//
//  Created by Jaqueline Aurelia Langi on 14/07/24.
//

import Foundation
import SwiftData

@Model
class Exercise {
    var id: UUID
    var weight: String
    var reps: String
    var exercise: String
    var oneRepMax: String
    var date: Date
    
    init(id: UUID = UUID(), weight: String, reps: String, exercise: String, oneRepMax: String, date: Date) {
        self.id = id
        self.weight = weight
        self.reps = reps
        self.exercise = exercise
        self.oneRepMax = oneRepMax
        self.date = date
    }
}
