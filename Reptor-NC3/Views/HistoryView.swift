//
//  HistoryView.swift
//  Reptor-NC3
//
//  Created by Jaqueline Aurelia Langi on 14/07/24.
//

import SwiftUI
import SwiftData

struct HistoryView: View {
//    @ObservedObject private var viewModel = RMCalculator()
    @Environment(\.modelContext) var modelContext
    @Query(sort: [SortDescriptor(\RMData.date, order: .reverse), SortDescriptor(\RMData.exercise, order: .forward)]) var rmData: [RMData]
    
    var body: some View {
        NavigationView {
            VStack {
                List{
                    ForEach(rmData) { data in
                        VStack(alignment: .leading) {
                            Text("Exercise: \(data.exercise)")
                            Text("Weight: \(data.weight) kg")
                            Text("Reps: \(data.reps)")
                            Text("1RM: \(data.oneRepMax) kg")
                            Text("Date: \(data.date)")
                        }
                        .padding()
                        .onTapGesture {
                            NavigationLink(destination: ExerciseDetailView(exercise: data.exercise))
                            {
                                
                            }
                        }
                    }
                    .onDelete(perform: { indexes in
                        for index in indexes {
                            modelContext.delete(rmData[index])
                        }
                    })
                }
                .navigationBarTitle("History")
            }
        }
    }
    
//    private func formatDate(_ date: Date) -> String {
//        let formatter = DateFormatter()
//        formatter.dateStyle = .medium
//        formatter.timeStyle = .short
//        return formatter.string(from: date)
//    }
}


#Preview {
    HistoryView()
}
