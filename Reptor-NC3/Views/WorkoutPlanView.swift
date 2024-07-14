import SwiftUI

struct WorkoutPlanView: View {
    let exercise: String = "Bench Press"
    let weight: Int = 100
    let reps: Int = 12
    let oneRepMax: Int = 140
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Exercise: \(exercise)")
                Text("Weight: \(weight) kg")
                Text("Reps: \(reps)")
                Text("1RM: \(oneRepMax) kg")
                Spacer()
            }
            .navigationBarTitle(Text("Workout Plan").font(.largeTitle), displayMode: .inline)
        }
    }
}

#Preview {
    WorkoutPlanView()
}
