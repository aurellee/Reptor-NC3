import SwiftUI

struct HypertrophyPlanView: View {
    @StateObject private var workoutPlanViewModel = WorkoutPlanViewModel()
    let oneRepMax: String
    
    var body: some View {
        NavigationStack {
            VStack {
                // Recommended Weights
                HStack{
                    Text("Recommended Weights")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Spacer()
                }
                
                HStack{
                    Text("\(workoutPlanViewModel.calculateWeightPercentage(percent: 0.6, oneRepMax: oneRepMax))-\(workoutPlanViewModel.calculateWeightPercentage(percent: 0.8, oneRepMax: oneRepMax)) kg")
                    Spacer()
                    Text("60-80% of \(oneRepMax) kg")
                }
                
                Rectangle()
                    .frame(height: 20)
                    .foregroundStyle(Color.blackWhite)
                
                // Recommended Reps
                HStack{
                    Text("Recommended Reps")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Spacer()
                }
                
                HStack{
                    Text("8-12 reps")
                    Spacer()
                }
                
                Rectangle()
                    .frame(height: 20)
                    .foregroundStyle(Color.blackWhite)
                
                // Recommended Sets
                HStack{
                    Text("Recommended Sets")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Spacer()
                }
                
                HStack{
                    Text("3-4 sets")
                    Spacer()
                }
                
                Rectangle()
                    .frame(height: 20)
                    .foregroundStyle(Color.blackWhite)
                
                // Recommended Rest
                HStack{
                    Text("Recommended Rest")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Spacer()
                }
                
                HStack{
                    Text("1-2 minutes between sets")
                    Spacer()
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    HypertrophyPlanView(oneRepMax: "140")
}
