//
//  WorkoutPlanView.swift
//  Reptor-NC3
//
//  Created by Jaqueline Aurelia Langi on 14/07/24.
//

import SwiftUI

struct WorkoutPlanView: View {
    let exercise: String
    let weight: String
    let reps: String
    let oneRepMax: String
    
    var body: some View {
        VStack {
            Text("Workout Plan")
                .font(.largeTitle)
                .padding()
            Text("Exercise: \(exercise)")
            Text("Weight: \(weight) kg")
            Text("Reps: \(reps)")
            Text("1RM: \(oneRepMax) kg")
            Spacer()
        }
        .padding()
        .navigationBarTitle("Workout Plan", displayMode: .inline)
    }
}

#Preview {
    WorkoutPlanView(exercise: "Weightlift", weight: "30.0", reps: "30", oneRepMax: "10")
}
