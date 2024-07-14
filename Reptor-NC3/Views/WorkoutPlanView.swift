import SwiftUI

struct WorkoutPlanView: View {
    let exercise: String = "Bench Press"
    let weight: Int = 100
    let reps: Int = 12
    let oneRepMax: Int = 140
    
    var body: some View {
        NavigationStack {
            VStack {
                // Category
                ScrollView(.horizontal){
                    HStack(spacing: 10){
                        Text("All")
                            .foregroundStyle(Color.boldRed)
                            .padding(.vertical, 7)
                            .padding(.horizontal, 14)
                            .background(Color.lightRed)
                            .cornerRadius(19)
                            .padding(.leading, 16)
                        Text("Strength")
                            .foregroundStyle(Color.secondary)
                            .padding(.vertical, 7)
                            .padding(.horizontal, 14)
                            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                            .cornerRadius(19)
                        Text("Hypertrophy")
                            .foregroundStyle(Color.secondary)
                            .padding(.vertical, 7)
                            .padding(.horizontal, 14)
                            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                            .cornerRadius(19)
                        Text("Endurance")
                            .foregroundStyle(Color.secondary)
                            .padding(.vertical, 7)
                            .padding(.horizontal, 14)
                            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                            .cornerRadius(19)
                            .padding(.trailing, 16)
                    }
                }
                .padding(.bottom)
                
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
            .navigationBarTitle(Text("Workout Plan").font(.largeTitle), displayMode: .inline)
        }
    }
}

#Preview {
    WorkoutPlanView()
}
