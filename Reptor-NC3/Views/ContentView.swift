import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        TabView {
            CalculatorView()
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Calculator")
                }
            
            HistoryView()
                .tabItem {
                    Image(systemName: "clock.arrow.circlepath")
                    Text("History")
                }
        }
        .accentColor(Color(hex: "CC2F26"))
        .onAppear() {
            UITabBar.appearance().backgroundColor = .white
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: RMData.self)
}
