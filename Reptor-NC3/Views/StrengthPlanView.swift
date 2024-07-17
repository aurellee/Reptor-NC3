import SwiftUI

struct StrengthPlanView: View {
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
//                        .padding(.leading, 15)
                    Spacer()
                }
                
                HStack{
                    Text("\(workoutPlanViewModel.calculateWeightPercentage(percent: 0.8, oneRepMax: oneRepMax))-\(workoutPlanViewModel.calculateWeightPercentage(percent: 0.9, oneRepMax: oneRepMax)) kg")
                    Spacer()
                    Text("80-90% of \(oneRepMax) kg")
                }
//                .padding(.horizontal)
                
                Rectangle()
                    .frame(height: 20)
                    .foregroundStyle(Color.blackWhite)
                
                // Recommended Reps
                HStack{
                    Text("Recommended Reps")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
//                        .padding(.leading, 15)
                    Spacer()
                }
                
                HStack{
                    Text("3-5 reps")
                    Spacer()
                }
//                .padding(.horizontal)
                
                Rectangle()
                    .frame(height: 20)
                    .foregroundStyle(Color.blackWhite)
                
                // Recommended Sets
                HStack{
                    Text("Recommended Sets")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
//                        .padding(.leading, 15)
                    Spacer()
                }
                
                HStack{
                    Text("4-6 sets")
                    Spacer()
                }
//                .padding(.horizontal)
                
                Rectangle()
                    .frame(height: 20)
                    .foregroundStyle(Color.blackWhite)
                
                // Recommended Rest
                HStack{
                    Text("Recommended Rest")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
//                        .padding(.leading, 15)
                    Spacer()
                }
                
                HStack{
                    Text("2-3 minutes between sets")
                    Spacer()
                }
//                .padding(.horizontal)
                
                Spacer()
            }
            .padding()
//            .navigationBarTitle(Text("Workout Plan").font(.largeTitle), displayMode: .inline)
        }
    }
}

#Preview {
    StrengthPlanView(oneRepMax: "140")
}
