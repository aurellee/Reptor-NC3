//
//  HistoryView.swift
//  Reptor-NC3
//
//  Created by Jaqueline Aurelia Langi on 14/07/24.
//

import SwiftUI

struct HistoryView: View {
    @ObservedObject private var viewModel = RMCalculator()
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.exercises) { exercise in
                    VStack(alignment: .leading) {
                        Text("Exercise: \(exercise.exercise)")
                        Text("Weight: \(exercise.weight) kg")
                        Text("Reps: \(exercise.reps)")
                        Text("1RM: \(exercise.oneRepMax) kg")
                    }
                    .padding()
                }
                .navigationBarTitle("History", displayMode: .inline)
            }
        }
    }
}

#Preview {
    HistoryView()
}
