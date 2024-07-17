import SwiftUI

struct EndurancePlanView: View {
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
                    Text("\(workoutPlanViewModel.calculateWeightPercentage(percent: 0.4, oneRepMax: oneRepMax))-\(workoutPlanViewModel.calculateWeightPercentage(percent: 0.6, oneRepMax: oneRepMax)) kg")
                    Spacer()
                    Text("40-60% of \(oneRepMax) kg")
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
                    Text("15-20 reps")
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
                    Text("2-3 sets")
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
                    Text("30-60 seconds between sets")
                    Spacer()
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    EndurancePlanView(oneRepMax: "140")
}
