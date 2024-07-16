//
//  HistoryView.swift
//  Reptor-NC3
//
//  Created by Jaqueline Aurelia Langi on 14/07/24.
//

import SwiftUI
import SwiftData

struct HistoryView: View {
    @ObservedObject private var viewModel = RMCalculator()
    @Query var rmData: [RMData]
    
    var body: some View {
        NavigationView {
            VStack {
//                List(viewModel.exercises) { exercise in
//                    VStack(alignment: .leading) {
//                        Text("Exercise: \(exercise.exercise)")
//                        Text("Weight: \(exercise.weight) kg")
//                        Text("Reps: \(exercise.reps)")
//                        Text("1RM: \(exercise.oneRepMax) kg")
                List{
                    ForEach(rmData) { data in
                        VStack(alignment: .leading) {
                            Text("Exercise: \(data.exercise)")
                            Text("Weight: \(data.weight) kg")
                            Text("Reps: \(data.reps)")
                            Text("1RM: \(data.oneRepMax) kg")
                        }
                        .padding()
                    }
                }
                .navigationBarTitle("History")
            }
        }
    }
}

#Preview {
    HistoryView()
}
