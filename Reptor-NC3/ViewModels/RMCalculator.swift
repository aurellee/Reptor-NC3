//  ContentView.swift
//  Reptor-NC3
//
//  Created by Jaqueline Aurelia Langi on 11/07/24.


import Foundation
import Combine
import SwiftData

@MainActor
class RMCalculator: ObservableObject {
    @Published var weight: String = ""
    @Published var reps: String = ""
    @Published var exercise: String = "None"
    @Published var oneRepMax: String = "0"
    @Published var exercises: [Exercise] = []
    
    let exerciseTypes = ["None", "Bench Press", "Squat", "Deadlift", "Overhead Press"]
    
    private var cancellables = Set<AnyCancellable>()
    private let storage: Storage
    
    init(storage: Storage = Storage()) {
        self.storage = storage
        setupBindings()
        loadExercises()
        addDummyData()
    }
    
    private func setupBindings() {
        $weight
            .combineLatest($reps, $exercise)
            .sink { [weak self] weight, reps, exercise in
                self?.calculateOneRepMax(weight: weight, reps: reps, exercise: exercise)
            }
            .store(in: &cancellables)
    }
    
    private func calculateOneRepMax(weight: String, reps: String, exercise: String) {
        guard let weight = Double(weight), let reps = Double(reps), exercise != "None" else {
            oneRepMax = "0"
            return
        }
        let orm = weight * (1 + reps / 30)
        oneRepMax = String(format: "%.0f", orm)
    }
    
    func saveExercise() {
        let newExercise = Exercise(weight: weight, reps: reps, exercise: exercise, oneRepMax: oneRepMax)
        exercises.append(newExercise)
        storage.saveExercises(exercises)
    }
    
    func loadExercises() {
        exercises = storage.loadExercises()
    }
    
    private func addDummyData() {
        exercises = [
            Exercise(weight: "100", reps: "10", exercise: "Bench Press", oneRepMax: "133"),
            Exercise(weight: "150", reps: "5", exercise: "Squat", oneRepMax: "175"),
            Exercise(weight: "120", reps: "8", exercise: "Deadlift", oneRepMax: "160"),
            Exercise(weight: "60", reps: "12", exercise: "Overhead Press", oneRepMax: "80")
        ]
    }
}
