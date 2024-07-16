//
//  HistoryView.swift
//  Reptor-NC3
//
//  Created by Jaqueline Aurelia Langi on 14/07/24.
//

import SwiftUI
import SwiftData

struct HistoryView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var exercises: [Exercise]

    var body: some View {
        VStack {
            List(exercises) { exercise in
                VStack(alignment: .leading) {
                    Text("Exercise: \(exercise.exercise)")
                    Text("Weight: \(exercise.weight) kg")
                    Text("Reps: \(exercise.reps)")
                    Text("1RM: \(exercise.oneRepMax) kg")
                    Text("Date: \(formatDate(exercise.date))")
                }
                .padding()
            }
            .navigationBarTitle("History", displayMode: .inline)
        }
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}


#Preview {
    HistoryView()
}
