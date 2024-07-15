//
//  Storage.swift
//  Reptor-NC3
//
//  Created by Jaqueline Aurelia Langi on 14/07/24.
//

import Foundation

struct Storage {
    private let exercisesKey = "exercises"
    
    func saveExercises(_ exercises: [Exercise]) {
        if let data = try? JSONEncoder().encode(exercises) {
            UserDefaults.standard.set(data, forKey: exercisesKey)
        }
    }
    
    func loadExercises() -> [Exercise] {
        if let data = UserDefaults.standard.data(forKey: exercisesKey),
           let exercises = try? JSONDecoder().decode([Exercise].self, from: data) {
            return exercises
        }
        return []
    }
}
