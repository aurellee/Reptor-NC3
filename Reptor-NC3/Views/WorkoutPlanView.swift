import SwiftUI

struct WorkoutPlanView: View {
    let exercise: String = "Bench Press"
    let weight: Int = 100
    let reps: Int = 12
    let oneRepMax: Int = 140
    
    @State var isAllTapped = true
    @State var isStrengthTapped = false
    @State var isHypertrophyTapped = false
    @State var isEnduranceTapped = false
    
    var body: some View {
        NavigationStack {
                VStack {
                    // Category
                    ScrollView(.horizontal){
                        HStack(spacing: 10){
                            Text("All")
                                .foregroundStyle(isAllTapped ? Color.boldRed : Color.secondary)
                                .padding(.vertical, 7)
                                .padding(.horizontal, 14)
                                .background(isAllTapped ? Color.lightRed : Color(red: 0.96, green: 0.96, blue: 0.96))
                                .cornerRadius(19)
                                .onTapGesture {
                                    isAllTapped = true
                                    isStrengthTapped = false
                                    isHypertrophyTapped = false
                                    isEnduranceTapped = false
                                }
                                .padding(.leading, 16)
                            Text("Strength")
                                .foregroundStyle(isStrengthTapped ? Color.boldRed : Color.secondary)
                                .padding(.vertical, 7)
                                .padding(.horizontal, 14)
                                .background(isStrengthTapped ? Color.lightRed : Color(red: 0.96, green: 0.96, blue: 0.96))
                                .cornerRadius(19)
                                .onTapGesture {
                                    isAllTapped = false
                                    isStrengthTapped = true
                                    isHypertrophyTapped = false
                                    isEnduranceTapped = false
                                }
                            Text("Hypertrophy")
                                .foregroundStyle(isHypertrophyTapped ? Color.boldRed : Color.secondary)
                                .padding(.vertical, 7)
                                .padding(.horizontal, 14)
                                .background(isHypertrophyTapped ? Color.lightRed : Color(red: 0.96, green: 0.96, blue: 0.96))
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
                                .background(isEnduranceTapped ? Color.lightRed : Color(red: 0.96, green: 0.96, blue: 0.96))
                                .cornerRadius(19)
                                .onTapGesture {
                                    isAllTapped = false
                                    isStrengthTapped = false
                                    isHypertrophyTapped = false
                                    isEnduranceTapped = true
                                }
                                .padding(.trailing, 16)
                        }
                    }
                    .padding(.bottom)
                    
                    if isStrengthTapped {
                        StrengthPlanView(isAllTapped: $isAllTapped, isStrengthTapped: $isStrengthTapped, isHypertrophyTapped: $isHypertrophyTapped, isEnduranceTapped: $isEnduranceTapped)
                    }
                    else if isHypertrophyTapped {
                        HypertrophyPlanView(isAllTapped: $isAllTapped, isStrengthTapped: $isStrengthTapped, isHypertrophyTapped: $isHypertrophyTapped, isEnduranceTapped: $isEnduranceTapped)
                    }
                    else if isEnduranceTapped {
                        EndurancePlanView(isAllTapped: $isAllTapped, isStrengthTapped: $isStrengthTapped, isHypertrophyTapped: $isHypertrophyTapped, isEnduranceTapped: $isEnduranceTapped)
                    }
                    else {
                        VStack{
                            // Estimated Rep Maxes
                            HStack{
                                Text("Estimated Rep Maxes")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                    .padding(.leading, 15)
                                Spacer()
                            }
                            
                            // Workout Plan Sheet
                            List {
                                ForEach(1..<13) { item in
                                    HStack(){
                                        Text("\(item) Reps")
                                            .padding(.leading)
                                        Spacer()
                                        Text("\(144 - item*4) kg")
                                        Spacer()
                                        Text("\(103 - item*3)%")
                                            .padding(.trailing)
                                    }
                                    .listRowInsets(EdgeInsets())
                                }
                            }
                            .listStyle(.plain)
                            
                            // Save History Button
                            Text("Save History")
                                .foregroundStyle(Color.white)
                                .padding(.vertical, 14)
                                .padding(.horizontal, 40)
                                .background(Color.boldRed)
                                .cornerRadius(19)
                            
                            Spacer()
                            
                            //                // Placeholder variables content
                            //                Text("Exercise: \(exercise)")
                            //                Text("Weight: \(weight) kg")
                            //                Text("Reps: \(reps)")
                            //                Text("1RM: \(oneRepMax) kg")
                            //                Spacer()
                        }
                        .padding(.horizontal)
                    }
            }
            .navigationBarTitle(Text("Workout Plan").font(.largeTitle), displayMode: .inline)
        }
    }
}

#Preview {
    WorkoutPlanView()
}
