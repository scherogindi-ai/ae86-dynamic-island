import ActivityKit
import WidgetKit
import SwiftUI

struct AE86LiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: AE86ActivityAttributes.self) { context in
            HStack(spacing: 10) {
                Image("AE86")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 105, height: 42)
                VStack(alignment: .leading, spacing: 3) {
                    Text(context.attributes.carName).font(.headline)
                    Text(context.state.status).font(.caption)
                }
                Spacer(minLength: 0)
            }
            .padding(.horizontal, 12)
            .activityBackgroundTint(Color.black)
            .activitySystemActionForegroundColor(Color.white)
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading) {
                    Image("AE86").resizable().scaledToFit().frame(width: 100, height: 45)
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text(context.state.status).font(.caption)
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("\(context.attributes.carName) • Panda Edition")
                        .font(.caption2)
                }
            } compactLeading: {
                Image("AE86").resizable().scaledToFit().frame(width: 35, height: 20)
            } compactTrailing: {
                Text("86").font(.caption2.bold())
            } minimal: {
                Text("86").font(.caption2.bold())
            }
            .keylineTint(.white)
        }
    }
}

@main
struct AE86WidgetBundle: WidgetBundle {
    var body: some Widget {
        AE86LiveActivity()
    }
}
