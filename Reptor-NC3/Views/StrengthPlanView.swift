import SwiftUI

struct StrengthPlanView: View {
    @Binding var isAllTapped: Bool
    @Binding var isStrengthTapped: Bool
    @Binding var isHypertrophyTapped: Bool
    @Binding var isEnduranceTapped: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                if isAllTapped {
                    WorkoutPlanView()
                }
                else if isHypertrophyTapped {
                    HypertrophyPlanView(isAllTapped: $isAllTapped, isStrengthTapped: $isStrengthTapped, isHypertrophyTapped: $isHypertrophyTapped, isEnduranceTapped: $isEnduranceTapped)
                }
                else if isEnduranceTapped {
                    EndurancePlanView(isAllTapped: $isAllTapped, isStrengthTapped: $isStrengthTapped, isHypertrophyTapped: $isHypertrophyTapped, isEnduranceTapped: $isEnduranceTapped)
                }
                else {
                    // Estimated Rep Maxes
                    HStack{
                        Text("Recommended Weights")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .padding(.leading, 15)
                        Spacer()
                    }
                    
                    Spacer()
                }
            }
        }
        .navigationBarTitle(Text("Workout Plan").font(.largeTitle), displayMode: .inline)
    }
}

//#Preview {
//    StrengthPlanView(isAllTapped: $isAllTapped, isHypertrophyTapped: $isHypertrophyTapped, isEnduranceTapped: $isEnduranceTapped)
//}
