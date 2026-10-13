import SwiftUI
import ActivityKit

@main
struct AE86App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    @State private var message = "Bereit für eine Fahrt?"

    var body: some View {
        VStack(spacing: 20) {
            Image("AE86")
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 190)
            Text("AE86 Panda")
                .font(.largeTitle.bold())
            Text(message)
                .foregroundStyle(.secondary)
            Button("Dynamic Island starten") {
                Task { await startActivity() }
            }
            .buttonStyle(.borderedProminent)
            Button("Live Activity beenden", role: .destructive) {
                Task { await endActivities() }
            }
            .buttonStyle(.bordered)
            Text("Hinweis: iOS bestimmt Darstellung und Animation der Dynamic Island.")
                .font(.footnote)
                .multilineTextAlignment(.center)
                .padding(.top, 8)
        }
        .padding()
    }

    @available(iOS 16.1, *)
    private func startActivity() async {
        guard ActivityAuthorizationInfo().areActivitiesEnabled else {
            message = "Live Activities sind in den iPhone-Einstellungen deaktiviert."
            return
        }
        let attributes = AE86ActivityAttributes(carName: "AE86 Panda")
        let state = AE86ActivityAttributes.ContentState(status: "Cruising", frame: 1)
        do {
            _ = try Activity.request(
                attributes: attributes,
                content: ActivityContent(state: state, staleDate: nil),
                pushType: nil
            )
            message = "Live Activity gestartet."
        } catch {
            message = "Konnte nicht starten: \(error.localizedDescription)"
        }
    }

    @available(iOS 16.1, *)
    private func endActivities() async {
        for activity in Activity<AE86ActivityAttributes>.activities {
            await activity.end(nil, dismissalPolicy: .immediate)
        }
        message = "Live Activity beendet."
    }
}
