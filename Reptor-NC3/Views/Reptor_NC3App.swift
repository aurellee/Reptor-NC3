import SwiftUI

@main
struct Reptor_NC3App: App {
    var body: some Scene {
        WindowGroup {
            TabBarView()
        }
        .modelContainer(for: RMData.self)
    }
}
