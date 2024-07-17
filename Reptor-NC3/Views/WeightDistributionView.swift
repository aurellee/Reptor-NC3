import SwiftUI

struct WeightDistributionView: View {
    @StateObject private var workoutPlanViewModel = WorkoutPlanViewModel()
    let oneRepMax: String
    
    var body: some View {
        // Title
        Text("Weight Distribution")
            .font(.title)
            .fontWeight(.semibold)
            .padding(.top, 50)
        
        Divider()
            .padding(.bottom)
        
        
        List {
            // Estimated Rep Maxes
            HStack {
                Text("Estimated Rep Maxes")
                    .font(.subheadline)
                    .foregroundStyle(Color.secondary)
                Spacer()
            }
            ForEach(0..<12) { index in
                HStack(){
                    Text("\(workoutPlanViewModel.repArray[index]) reps")
                        .padding(.leading)
                    Spacer()
                    Text("\(workoutPlanViewModel.calulateWeights(oneRepMax: oneRepMax)[index]) kg")
                    Spacer()
                    Text("\(workoutPlanViewModel.percentArray[index])%")
                        .padding(.trailing)
                }
                .listRowInsets(EdgeInsets())
            }
        }
        .listStyle(.plain)
        .padding(.horizontal)
    }
}

#Preview {
    WeightDistributionView(oneRepMax: "140")
}
