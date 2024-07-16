//  ContentView.swift
//  Reptor-NC3
//
//  Created by Jaqueline Aurelia Langi on 11/07/24.


import Foundation
import Combine

@MainActor
class RMCalculator: ObservableObject {
    @Published var weight: String = ""
    @Published var reps: String = ""
    @Published var exercise: String = "None"
    @Published var oneRepMax: String = "0"
    
    let exerciseTypes = ["None", "Bench Press", "Squat", "Deadlift", "Overhead Press"]
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupBindings()
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
}
