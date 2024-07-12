
//
//  ContentView.swift
//  Reptor-NC3
//
//  Created by Jaqueline Aurelia Langi on 11/07/24.



import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CalculatorView()
                .tabItem {
                    Image(systemName: "figure.gymnastics")
                    Text("Calculator")
                }
            
            HistoryView()
                .tabItem {
                    Image(systemName: "book.closed.fill")
                    Text("History")
                }
        }
        .accentColor(.red) // Change the tab item color if needed
    }
}


struct CalculatorView: View {
    @State private var weight: String = ""
    @State private var reps: String = ""
    @State private var exercise: String = "Bench Press"
    @State private var oneRepMax: String = "0"

    let exercises = ["Bench Press", "Squat", "Deadlift"]

    var body: some View {
        ZStack {
            // Background color
            Color(hex: "F2F2F7")
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 20) {
                Spacer()
                    .frame(height: 80)
                
                VStack {
                    Text("Your 1RM is..")
                        .font(.headline)
                        .padding(.top, 20)
                    
                    HStack (alignment: .bottom, spacing: 2) {
                        Text("\(oneRepMax)")
                            .font(.system(size: 84, weight: .bold))
                        Text("kg")
                            .font(.system(size: 30, weight: .bold))
                        .padding(.bottom, 14)
                    }
                    
                    HStack {
                        TextField("100 kg", text: $weight)
                            .keyboardType(.numberPad)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(8)
                            .shadow(radius: 1)
                        
                        TextField("12", text: $reps)
                            .keyboardType(.numberPad)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(8)
                            .shadow(radius: 1)
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        Text("Exercise")
                            .font(.headline)
                        Spacer()
                        Picker(selection: $exercise, label: Text(exercise)) {
                            ForEach(exercises, id: \.self) { exercise in
                                Text(exercise).tag(exercise)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(radius: 1)
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    Button(action: calculateOneRepMax) {
                        Text("See Workout Plan")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(hex: "CC2F26"))
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    
//                    Button(action: seeWorkoutPlan) {
//                        Text("See Workout Plan")
//                            .font(.headline)
//                            .foregroundColor(.red)
//                            .padding()
//                            .frame(maxWidth: .infinity)
//                            .background(Color.white)
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 10)
//                                    .stroke(Color(hex: "CC2F26"), lineWidth: 1)
//                            )
//                    }
//                    .padding(.horizontal)
                    
                    Spacer()
                }
            }

            // Top bar with title
            VStack {
                HStack {
                    Spacer()
                    Text("Calculator")
                        .font(.headline)
                        .padding()
                    Spacer()
                }
                .frame(height: 60)
                .background(Color.white)
                .shadow(radius: 1)
                
                Spacer()
            }
        }
    }
    
    func calculateOneRepMax() {
        guard let weight = Double(weight), let reps = Double(reps) else {
            oneRepMax = "0"
            return
        }
        // Formula to calculate 1RM
        let orm = weight * (1 + reps / 30)
        oneRepMax = String(format: "%.0f", orm)
    }
    
    func seeWorkoutPlan() {
        // Action for the "See Workout Plan" button
    }
}




struct HistoryView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("History Page")
                    .font(.largeTitle)
                    .padding()
                // Add more content here for the history page
            }
            .navigationBarTitle("History", displayMode: .inline)
        }
    }
}








// Extension to use hex colors
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >>  8) & 0xFF) / 255.0
        let b = Double((rgb >>  0) & 0xFF) / 255.0
        
        self.init(red: r, green: g, blue: b)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
