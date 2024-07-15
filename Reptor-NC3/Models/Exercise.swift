//
//  ExerciseModel.swift
//  Reptor-NC3
//
//  Created by Jaqueline Aurelia Langi on 14/07/24.
//

import Foundation

struct Exercise: Identifiable, Codable {
    var id = UUID()
    var weight: String
    var reps: String
    var exercise: String
    var oneRepMax: String
}
