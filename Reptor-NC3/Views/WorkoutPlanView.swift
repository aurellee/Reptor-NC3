import SwiftUI
import SwiftData

struct WorkoutPlanView: View {
    @Environment(\.modelContext) var modelContext
    @StateObject private var workoutPlanViewModel = WorkoutPlanViewModel()
    
    let exercise: String
    let weight: String
    let reps: String
    let oneRepMax: String
    let date = Date.now.formatted(date: .numeric, time: .shortened)
    
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
                Text("140")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(.leading, 15)
                Text("kg")
                    .fontWeight(.semibold)
                    .padding(.top, 10)
                Spacer()
            }
            
            HStack {
                Text("Bench Press")
                    .foregroundStyle(Color.secondary)
                    .padding(.leading, 15)
                Spacer()
            }
            .padding(.bottom, 12)
            
            HStack {
                Text("Show More Weight Distribution Data")
                    .font(.caption)
                    .foregroundStyle(Color.blue)
                    .padding(.leading, 15)
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
                    .foregroundStyle(isStrengthTapped ? Color.boldRed : Color.secondary)
                    .padding(.vertical, 7)
                    .padding(.horizontal, 14)
                    .background(isStrengthTapped ? Color.lightRed : Color.secondaryBackground)
                    .cornerRadius(19)
                    .onTapGesture {
                        isAllTapped = false
                        isStrengthTapped = true
                        isHypertrophyTapped = false
                        isEnduranceTapped = false
                    }
//                        .padding(.leading, 16)
                Text("Muscle Growth")
                    .foregroundStyle(isHypertrophyTapped ? Color.boldRed : Color.secondary)
                    .padding(.vertical, 7)
                    .padding(.horizontal, 14)
                    .background(isHypertrophyTapped ? Color.lightRed : Color.secondaryBackground)
                    .cornerRadius(19)
                    .onTapGesture {
                        isAllTapped = false
                        isStrengthTapped = false
                        isHypertrophyTapped = true
                        isEnduranceTapped = false
                    }
                Text("Endurance")
                    .foregroundStyle(isEnduranceTapped ? Color.boldRed : Color.secondary)
                    .padding(.vertical, 7)
                    .padding(.horizontal, 14)
                    .background(isEnduranceTapped ? Color.lightRed : Color.secondaryBackground)
                    .cornerRadius(19)
                    .onTapGesture {
                        isAllTapped = false
                        isStrengthTapped = false
                        isHypertrophyTapped = false
                        isEnduranceTapped = true
                    }
            }
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
     WorkoutPlanView(exercise: "Weightlift", weight: "30.0", reps: "30", oneRepMax: "120")
}
