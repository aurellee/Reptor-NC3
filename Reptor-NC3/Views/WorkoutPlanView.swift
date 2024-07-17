import SwiftUI
import SwiftData

struct WorkoutPlanView: View {
    @Environment(\.modelContext) var modelContext
    @StateObject private var workoutPlanViewModel = WorkoutPlanViewModel()
    
    let exercise: String
    let weight: String
    let reps: String
    let oneRepMax: String
    let date: String
    
    @State var showWeightDistribution = false
    @State var isAllTapped = true
    @State var isStrengthTapped = true
    @State var isHypertrophyTapped = false
    @State var isEnduranceTapped = false
    
    var body: some View {
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
                .padding(.leading, 15)
                .sheet(isPresented: $showWeightDistribution) {
                    WeightDistributionView(oneRepMax: oneRepMax)
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
                Text("Strength")
                    .foregroundStyle(isStrengthTapped ? Color.primary : Color.secondary)
                    .padding(.vertical, 7)
                    .padding(.horizontal, 14)
//                    .background(isStrengthTapped ? Color.blackWhite : Color.secondaryBackground)
                    .background(isStrengthTapped ?
                            Rectangle()
                        .foregroundStyle(Color.blackWhite)
                        .frame(width: 90, height: 30)
                        .cornerRadius(6.5)
                        .shadow(radius: isStrengthTapped ? 3 : 0)
                                :
                            Rectangle()
                        .foregroundStyle(Color.secondaryBackground)
                        .frame(width: 90, height: 30)
                        .cornerRadius(6.5)
                        .shadow(radius: isStrengthTapped ? 3 : 0))
                    .cornerRadius(6.5)
                    .onTapGesture {
                        isAllTapped = false
                        isStrengthTapped = true
                        isHypertrophyTapped = false
                        isEnduranceTapped = false
                    }
//                        .padding(.leading, 16)
                Text("Muscle Growth")
                    .foregroundStyle(isHypertrophyTapped ? Color.primary : Color.secondary)
                    .padding(.vertical, 7)
                    .padding(.horizontal, 14)
//                    .background(isHypertrophyTapped ? Color.blackWhite : Color.secondaryBackground)
                    .background(isHypertrophyTapped ?
                            Rectangle()
                        .foregroundStyle(Color.blackWhite)
                        .frame(width: 130, height: 30)
                        .cornerRadius(6.5)
                        .shadow(radius: isHypertrophyTapped ? 3 : 0)
                                :
                            Rectangle()
                        .foregroundStyle(Color.secondaryBackground)
                        .frame(width: 130, height: 30)
                        .cornerRadius(6.5)
                        .shadow(radius: isHypertrophyTapped ? 3 : 0))
                    .cornerRadius(6.5)
                    .onTapGesture {
                        isAllTapped = false
                        isStrengthTapped = false
                        isHypertrophyTapped = true
                        isEnduranceTapped = false
                    }
                Text("Endurance")
                    .foregroundStyle(isEnduranceTapped ? Color.primary : Color.secondary)
                    .padding(.vertical, 7)
                    .padding(.horizontal, 14)
//                    .background(isEnduranceTapped ? Color.blackWhite : Color.secondaryBackground)
                    .background(isEnduranceTapped ?
                            Rectangle()
                        .foregroundStyle(Color.blackWhite)
                        .frame(width: 100, height: 30)
                        .cornerRadius(6.5)
                        .shadow(radius: isEnduranceTapped ? 3 : 0)
                                :
                            Rectangle()
                        .foregroundStyle(Color.secondaryBackground)
                        .frame(width: 100, height: 30)
                        .cornerRadius(6.5)
                        .shadow(radius: isEnduranceTapped ? 3 : 0))
                    .cornerRadius(6.5)
                    .onTapGesture {
                        isAllTapped = false
                        isStrengthTapped = false
                        isHypertrophyTapped = false
                        isEnduranceTapped = true
                    }
            }
            .background(
                Rectangle()
                    .cornerRadius(8)
                    .foregroundStyle(Color.secondaryBackground)
            )
            .padding(.bottom)
            
            // Plan View
            VStack{
                if isStrengthTapped {
                    StrengthPlanView(oneRepMax: oneRepMax)
                }
                else if isHypertrophyTapped {
                    HypertrophyPlanView(oneRepMax: oneRepMax)
                }
                else if isEnduranceTapped {
                    EndurancePlanView(oneRepMax: oneRepMax)
                }
                else {
                    StrengthPlanView(oneRepMax: oneRepMax)
                }
            }
            Spacer()
        }
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

#Preview {
    WorkoutPlanView(exercise: "Weightlift", weight: "30.0", reps: "30", oneRepMax: "120", date: "17/07/2024")
}
