import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        TabView {
            CalculatorView()
                .tabItem {
                    Image(systemName: "dumbbell")
                    Text("Calculator")
                }
            
            HistoryView()
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
    ContentView()
        .modelContainer(for: RMData.self)
}
