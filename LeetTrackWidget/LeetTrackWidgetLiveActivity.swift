//
//  LeetTrackWidgetLiveActivity.swift
//  LeetTrackWidget
//
//  Created by Sathvik Konuganti on 2/24/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct LeetTrackWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct LeetTrackWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: LeetTrackWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension LeetTrackWidgetAttributes {
    fileprivate static var preview: LeetTrackWidgetAttributes {
        LeetTrackWidgetAttributes(name: "World")
    }
}

extension LeetTrackWidgetAttributes.ContentState {
    fileprivate static var smiley: LeetTrackWidgetAttributes.ContentState {
        LeetTrackWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: LeetTrackWidgetAttributes.ContentState {
         LeetTrackWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: LeetTrackWidgetAttributes.preview) {
   LeetTrackWidgetLiveActivity()
} contentStates: {
    LeetTrackWidgetAttributes.ContentState.smiley
    LeetTrackWidgetAttributes.ContentState.starEyes
}
