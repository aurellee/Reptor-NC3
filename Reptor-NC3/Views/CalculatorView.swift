//
//  CalculatorView.swift
//  Reptor-NC3
//
//  Created by Jaqueline Aurelia Langi on 14/07/24.
//

import SwiftUI

struct CalculatorView: View {
    @StateObject private var viewModel = RMCalculator()
    
    var body: some View {
        ZStack {
            Color(hex: "F2F2F7")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer().frame(height: 60)
                
                Text("Calculator")
                    .font(.system(size: 36, weight: .heavy))
                    .foregroundStyle(Color(hex: "CC2F26"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                Spacer().frame(height: 60)
                
                Text("Your 1RM is..")
                    .foregroundStyle(Color(.gray))
                
                Spacer().frame(height: 4)
                
                HStack(alignment: .bottom, spacing: 2) {
                    Text("\(viewModel.oneRepMax)")
                        .font(.system(size: 84, weight: .bold))
                    Text("kg")
                        .font(.system(size: 30, weight: .bold))
                        .padding(.bottom, 14)
                }
                .padding(.bottom, 40)
                
                HStack {
                    TextField("Weight", text: $viewModel.weight)
                        .keyboardType(.numberPad)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(radius: 1)
                    
                    TextField("Rep", text: $viewModel.reps)
                        .keyboardType(.numberPad)
                        .padding()
                        .background(Color.white)
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
                    .foregroundColor(.red)
                    .pickerStyle(MenuPickerStyle())
                }
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .shadow(radius: 1)
                .padding(.horizontal)
                
                NavigationLink(
                    destination: WorkoutPlanView(exercise: viewModel.exercise, weight: viewModel.weight, reps: viewModel.reps, oneRepMax: viewModel.oneRepMax)
                        .onAppear {
                            viewModel.saveExercise()
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

#Preview {
    CalculatorView()
}
