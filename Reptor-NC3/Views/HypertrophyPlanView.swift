import SwiftUI

struct HypertrophyPlanView: View {
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
                    else if isStrengthTapped {
                        StrengthPlanView(isAllTapped: $isAllTapped, isStrengthTapped: $isStrengthTapped, isHypertrophyTapped: $isHypertrophyTapped, isEnduranceTapped: $isEnduranceTapped)
                    }
                    else if isEnduranceTapped {
                        EndurancePlanView(isAllTapped: $isAllTapped, isStrengthTapped: $isStrengthTapped, isHypertrophyTapped: $isHypertrophyTapped, isEnduranceTapped: $isEnduranceTapped)
                    }
                    else {
                        // Recommended Weights
                        HStack{
                            Text("Recommended Weights")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .padding(.leading, 15)
                            Spacer()
                        }
                        
                        HStack{
                            Text("84-112 kg")
                            Spacer()
                            Text("60-80% of 140 kg")
                        }
                        .padding(.horizontal)
                        
                        Rectangle()
                            .frame(height: 20)
                            .foregroundStyle(Color.blackWhite)
                        
                        // Recommended Reps
                        HStack{
                            Text("Recommended Reps")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .padding(.leading, 15)
                            Spacer()
                        }
                        
                        HStack{
                            Text("8-12 reps")
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        Rectangle()
                            .frame(height: 20)
                            .foregroundStyle(Color.blackWhite)
                        
                        // Recommended Sets
                        HStack{
                            Text("Recommended Sets")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .padding(.leading, 15)
                            Spacer()
                        }
                        
                        HStack{
                            Text("3-4 Sets")
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        Rectangle()
                            .frame(height: 20)
                            .foregroundStyle(Color.blackWhite)
                        
                        // Recommended Rest
                        HStack{
                            Text("Recommended Rest")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .padding(.leading, 15)
                            Spacer()
                        }
                        
                        HStack{
                            Text("1-2 minutes between sets")
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        Spacer()
                        
                        // Save History Button
                        Text("Save History")
                            .foregroundStyle(Color.white)
                            .padding(.vertical, 14)
                            .padding(.horizontal, 40)
                            .background(Color.boldRed)
                            .cornerRadius(19)
                        
                        Spacer()
                }
            }
            .padding()
            .navigationBarTitle(Text("Workout Plan").font(.largeTitle), displayMode: .inline)
        }
    }
}

#Preview {
    HypertrophyPlanView(isAllTapped: .constant(false), isStrengthTapped: .constant(false), isHypertrophyTapped: .constant(true), isEnduranceTapped: .constant(false))
}
