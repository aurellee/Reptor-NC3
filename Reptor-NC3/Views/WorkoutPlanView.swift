import SwiftUI
import SwiftData

struct WorkoutPlanView: View {
    @Environment(\.modelContext) var modelContext
    
    let exercise: String
    let weight: String
    let reps: String
    let oneRepMax: String
    let date: String
    
    @State var showWeightDistribution = false
    @State var workoutFocus = 0
    
    @Binding var showPopup: Bool
    
    var body: some View {
        ZStack {
            VStack {
                // 1RM Details
                HStack {
                    Text("1RM")
                        .font(.subheadline)
                        .foregroundStyle(Color.secondary)
                        .padding(.leading, 15)
                    Spacer()
                }
                
                HStack {
                    Text("\(oneRepMax)")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .padding(.leading, 15)
                    Text("kg")
                        .fontWeight(.semibold)
                        .padding(.top, 10)
                    Spacer()
                }
                
                HStack {
                    Text("\(exercise)")
                        .foregroundStyle(Color.secondary)
                        .padding(.leading, 15)
                    Spacer()
                }
                .padding(.bottom, 12)
                
                HStack {
                    Button("Show More Weight Distribution Data"){
                        showWeightDistribution.toggle()
                    }
                    .font(.caption)
                    .foregroundStyle(Color.blue)
                    .padding(.leading, 15)
                    .sheet(isPresented: $showWeightDistribution) {
                        WeightDistributionView(oneRepMax: oneRepMax)
                            .presentationDragIndicator(.visible)
                    }
                    Spacer()
                }
                .padding(.bottom, 48)
                
                HStack {
                    Text("Focus")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(.semibold)
                        .padding(.leading, 15)
                    Spacer()
                }
                
                // Category
                HStack(spacing: 10){
                    Picker("", selection: $workoutFocus) {
                        Text("Strength").tag(0)
                        Text("Muscle Growth").tag(1)
                        Text("Endurance").tag(2)
                    }
                    .pickerStyle(.segmented)
                    .padding(.horizontal)
                    
                }
                .padding(.bottom)
                
                // Plan View
                VStack{
                    if workoutFocus == 0 {
                        StrengthPlanView(oneRepMax: oneRepMax)
                    }
                    else if workoutFocus == 1 {
                        HypertrophyPlanView(oneRepMax: oneRepMax)
                    }
                    else if workoutFocus == 2 {
                        EndurancePlanView(oneRepMax: oneRepMax)
                    }
                    else {
                        StrengthPlanView(oneRepMax: oneRepMax)
                    }
                }
                Spacer()
            }
            if showPopup {
//                Image("savePopup")
//                .opacity(0.8)
                ZStack{
                    Rectangle()
                        .foregroundStyle(Color.secondaryBackground)
                        .frame(width: 155, height: 157)
                        .cornerRadius(8)
                    VStack {
                        Image(systemName: "checkmark.circle")
                            .resizable()
                            .frame(width: 72, height: 72)
                            .foregroundStyle(Color.greenPopup)
                            .padding(.bottom, 12)
                        Text("Workout Plan")
                    }
                }
                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

#Preview {
    WorkoutPlanView(exercise: "Weightlift", weight: "30.0", reps: "30", oneRepMax: "120", date: "17/07/2024", showPopup: .constant(false))
}
