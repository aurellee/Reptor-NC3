import SwiftUI
import SwiftData

struct TabBarView: View {
    var body: some View {
        TabView {
            CalculatorView()
                .tabItem {
                    Image(systemName: "dumbbell")
                    Text("Calculator")
                }
            
            SavedPlanView()
                .tabItem {
                    Image(systemName: "list.bullet.rectangle.portrait.fill")
                    Text("Saved Plans")
                }
        }
        .accentColor(Color.boldRed)
        .onAppear() {
            UITabBar.appearance().backgroundColor = .blackWhite
        }
    }
}

#Preview {
    TabBarView()
        .modelContainer(for: RMData.self)
}
