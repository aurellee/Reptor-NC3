import SwiftUI

struct TabBarView: View {
    @State private var selectedIndex: Int = 0
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            NavigationStack() {
                ContentView()
                    .navigationTitle("Calculcator")
            }
            .tabItem {
                // Calculator Tab
                Text("Calculator")
                Image(systemName: "star.fill")
                    .renderingMode(.template)
            }
            .tag(0)
            
            NavigationStack() {
                WorkoutPlanView()
                    .navigationTitle("History")
            }
            .tabItem {
                Label("History", systemImage: "clock.arrow.circlepath")
                    .foregroundStyle(Color.boldRed)
            }
            .tag(1)
        }
        .accentColor(.boldRed)
    }
}

#Preview {
    TabBarView()
}
