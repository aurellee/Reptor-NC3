import SwiftUI
import SwiftData

struct HistoryView: View {
//    @ObservedObject private var viewModel = RMCalculator()
    @Environment(\.modelContext) var modelContext
    @Query(sort: [SortDescriptor(\RMData.date, order: .reverse), SortDescriptor(\RMData.exercise, order: .forward)]) var rmData: [RMData]
    
    var body: some View {
        NavigationStack {
            VStack {
                List{
                    ForEach(rmData) { data in
                        NavigationLink(
                            destination: ExerciseDetailView(exercise: data.exercise))
                        {
                            VStack(alignment: .leading) {
                                Text("Exercise: \(data.exercise)")
                                Text("Weight: \(data.weight) kg")
                                Text("Reps: \(data.reps)")
                                Text("1RM: \(data.oneRepMax) kg")
                                Text("Date: \(data.date)")
                            }
                            .padding()
                        }
                    }
                    .onDelete(perform: { indexes in
                        for index in indexes {
                            modelContext.delete(rmData[index])
                        }
                    })
                }
            }
            .navigationBarTitle("Saved Plans")
        }
    }
}


#Preview {
    HistoryView()
}
