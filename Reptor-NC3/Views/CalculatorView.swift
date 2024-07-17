import SwiftUI
import SwiftData

struct CalculatorView: View {
    @StateObject private var viewModel = RMCalculator()
    @Environment(\.modelContext) private var modelContext
    
    let date = Date.now.formatted(date: .numeric, time: .shortened)
    @State var showPopup = false
    @State var saveDisabled = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.primaryBackground
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer().frame(height: 60)
                    
                    Text("Calculator")
                        .font(.system(size: 36, weight: .heavy))
                        .foregroundColor(Color.boldRed)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    
                    Spacer().frame(height: 46)
                    
                    Text("Your 1RM is..")
                        .foregroundColor(Color.secondary)
                    
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
                            .background(Color.listFill)
                            .cornerRadius(8)
//                            .shadow(radius: 1)
                        
                        TextField("Rep", text: $viewModel.reps)
                            .keyboardType(.numberPad)
                            .padding()
                            .background(Color.listFill)
                            .cornerRadius(8)
//                            .shadow(radius: 1)
                    }
                    .frame(width: 361, height: 44)
                    .padding(.horizontal)
                    .padding(.bottom, 8)
                    
                    
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
                    .frame(width: 361, height: 44)
                    .background(Color.listFill)
                    .cornerRadius(8)
//                    .shadow(radius: 1)
                    .padding(.horizontal)
                    .padding(.bottom, 12)
                    
                    NavigationLink(
                        destination: WorkoutPlanView(exercise: viewModel.exercise, weight: viewModel.weight, reps: viewModel.reps, oneRepMax: viewModel.oneRepMax, date: date, showPopup: $showPopup)
                            .onAppear{saveDisabled = false}
                            .toolbar {
                                ToolbarItem(placement: .topBarTrailing) {
                                    Button("Save") {
                                        // haptics
                                        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                                        saveDisabled = true
                                        showPopup = true
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                            showPopup = false
                                        }
                                        // save data
                                        modelContext.insert(RMData(weight: viewModel.weight, reps: viewModel.reps, exercise: viewModel.exercise, oneRepMax: viewModel.oneRepMax, date: date))
                                    }
                                    .disabled(saveDisabled)
                                }
                            }
                    ) {
                        Text("See Workout Plan")
                            .font(.headline)
                            .foregroundStyle(viewModel.weight.isEmpty || viewModel.reps.isEmpty || viewModel.exercise == "None" ? Color.disableButtonText : Color.blackWhite)
                            .padding()
                            .frame(width: 176, height: 50)
                            .background(viewModel.weight.isEmpty || viewModel.reps.isEmpty || viewModel.exercise == "None" ? Color.disableButton : Color.boldRed)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    .disabled(viewModel.weight.isEmpty || viewModel.reps.isEmpty || viewModel.exercise == "None")
                    
                    Spacer()
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    UIApplication.shared.endEditing() // Hide the keyboard when tapping outside the TextFields
                }
            }
        }
    }
}

#Preview {
    CalculatorView()
        .modelContainer(for: RMData.self)
}
