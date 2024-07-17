import SwiftUI
import SwiftData

struct ExerciseDetailView: View {
    let exercise : String
    @Query(sort: [SortDescriptor(\RMData.date, order: .reverse)]) var rmData: [RMData]
    
    @State var showWorkoutPlan = false
    var body: some View {
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
                NavigationLink(destination: WorkoutPlanView(exercise: data.exercise, weight: data.weight, reps: data.reps, oneRepMax: data.oneRepMax, date: data.date, showPopup: .constant(false)))
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
}

#Preview {
    ExerciseDetailView(exercise: "Squat")
}
