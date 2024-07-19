import SwiftUI
import SwiftData

struct ExerciseDetailView: View {
    let exercise : String
    @State var showDate = true
    @Query(sort: [SortDescriptor(\RMData.datetime, order: .reverse)]) var rmData: [RMData]
    
    @State var showWorkoutPlan = false
    var body: some View {
        NavigationStack {
            HStack {
                Text("1RM")
                    .font(.subheadline)
                    .foregroundStyle(Color.secondary)
                    .padding(.leading, 15)
                Spacer()
            }
            List {
                ForEach(rmData) { data in
                    if data.exercise == exercise {
                        NavigationLink(destination: WorkoutPlanView(exercise: data.exercise, weight: data.weight, reps: data.reps, oneRepMax: data.oneRepMax, date: data.date, showDate: $showDate, showPopup: .constant(false)))
                        {
                            HStack {
                                Text("\(data.oneRepMax) kg")
                                Spacer()
                                Text(data.date)
                                    .foregroundStyle(Color.secondary)
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle(exercise)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ExerciseDetailView(exercise: "Squat")
}
