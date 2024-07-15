import SwiftUI

struct TabBarView: View {
    @State private var selectedIndex: Int = 0
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            NavigationStack() {
                WorkoutPlanView()
                    .navigationTitle("Workout Plan")
//                    .navigationBarTitleDisplayMode(.inline)
            }
            .tabItem {
                // Calculator Tab
                Label("Calculator", systemImage: "star.fill")
            }
            .tag(0)
            
            NavigationStack() {
                ContentView()
                    .navigationTitle("History")
            }
            .tabItem {
                // History Tab
                Label("History", systemImage: "clock.arrow.circlepath")
            }
            .tag(1)
        }
        .accentColor(.boldRed)
    }
}

#Preview {
    TabBarView()
}
