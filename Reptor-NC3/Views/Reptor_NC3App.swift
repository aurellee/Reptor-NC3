import SwiftUI

@main
struct Reptor_NC3App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: RMData.self)
    }
}
