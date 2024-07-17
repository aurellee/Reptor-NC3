import SwiftUI
import SwiftData

struct CalculatorView: View {
    @StateObject private var viewModel = RMCalculator()
    @Environment(\.modelContext) private var modelContext
    
    let date = Date.now.formatted(date: .numeric, time: .shortened)
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.secondaryBackground
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer().frame(height: 60)
                    
                    Text("Calculator")
                        .font(.system(size: 36, weight: .heavy))
                        .foregroundColor(Color(hex: "CC2F26"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    
                    Spacer().frame(height: 46)
                    
                    Text("Your 1RM is..")
                        .foregroundColor(Color(.gray))
                    
                    Spacer().frame(height: 4)
                    
                    HStack(alignment: .bottom, spacing: 2) {
                        Text("\(viewModel.oneRepMax)")
                            .font(.system(size: 84, weight: .bold))
                        Text("kg")
                            .font(.system(size: 30, weight: .bold))
                            .padding(.bottom, 14)
                    }
                    .padding(.bottom, 30)
                    
                    HStack {
                        TextField("Weight", text: $viewModel.weight)
                            .keyboardType(.numberPad)
                            .padding()
                            .background(Color.blackWhite)
                            .cornerRadius(8)
                            .shadow(radius: 1)
                        
                        TextField("Rep", text: $viewModel.reps)
                            .keyboardType(.numberPad)
                            .padding()
                            .background(Color.blackWhite)
                            .cornerRadius(8)
                            .shadow(radius: 1)
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        Text("Exercise")
                        Spacer()
                        Picker(selection: $viewModel.exercise, label: Text(viewModel.exercise).foregroundColor(.red)) {
                            ForEach(viewModel.exerciseTypes, id: \.self) { exercise in
                                Text(exercise).tag(exercise)
                                    .foregroundColor(.red)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                    }
                    .padding()
                    .background(Color.blackWhite)
                    .cornerRadius(8)
                    .shadow(radius: 1)
                    .padding(.horizontal)
                    
                    NavigationLink(
                        destination: WorkoutPlanView(exercise: viewModel.exercise, weight: viewModel.weight, reps: viewModel.reps, oneRepMax: viewModel.oneRepMax)
                            .toolbar {
                                ToolbarItem(placement: .topBarTrailing) {
                                    Button("Save") {
                                        // haptics
                                        UIImpactFeedbackGenerator(style: .light).impactOccurred()
                                        
                                        // save data
                                        modelContext.insert(RMData(weight: viewModel.weight, reps: viewModel.reps, exercise: viewModel.exercise, oneRepMax: viewModel.oneRepMax, date: date))
                                    }
                                }
                            }
                    ) {
                        Text("See Workout Plan")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(hex: "CC2F26"))
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    .padding(.top, 80)
                    .disabled(viewModel.weight.isEmpty || viewModel.reps.isEmpty || viewModel.exercise == "None")
                    .opacity((viewModel.weight.isEmpty || viewModel.reps.isEmpty || viewModel.exercise == "None") ? 0.5 : 1.0)
                    
                    Spacer()
                }
            }
        }
    }
}

