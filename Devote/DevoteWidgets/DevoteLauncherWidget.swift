//
//  DevoteWidgets.swift
//  DevoteWidgets
//
//  Created by Dylan on 09/12/2024.
//

import WidgetKit
import SwiftUI

// MARK: - ENTRY TIMELINE PROVIDER
struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> DevoteLauncherWidgetEntry {
        DevoteLauncherWidgetEntry(date: Date(), text: "Just Do It")
    }

    func getSnapshot(in context: Context, completion: @escaping (DevoteLauncherWidgetEntry) -> ()) {
        let entry = DevoteLauncherWidgetEntry(date: Date(), text: "Just Do It")
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [DevoteLauncherWidgetEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date, and alternating between "Just Do It" and "Let's Do It"
        let currentDate = Date()
        for offset in 0..<5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: offset, to: currentDate)!
            let text = offset % 2 == 0 ? "Just Do It" : "Let's Do It"
            let entry = DevoteLauncherWidgetEntry(date: entryDate, text: text)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

// MARK: - WIDGET ENTRY
struct DevoteLauncherWidgetEntry: TimelineEntry {
    let date: Date
    let text: String
}

// MARK: - WIDGET ENTRY VIEW
struct DevoteLauncherWidgetEntryView : View {
    // MARK: - ENVIRONMENT
    @Environment(\.widgetFamily) var widgetFamily
    // MARK: - PROPERTIES
    let entry: Provider.Entry
    // MARK: - COMPUTER PROPERTIES
    var fontStyle: Font {
        if widgetFamily == .systemSmall {
            return .system(.footnote, design: .rounded)
        } else {
            return .system(.headline, design: .rounded)
        }
    }
    // MARK: - BODY
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(.rocketSmall)
                    .resizable()
                    .scaledToFit()
                Image(.logo)
                    .resizable()
                    .frame(
                        width: widgetFamily != .systemSmall ? 56.0 : 36.0,
                        height: widgetFamily != .systemSmall ? 56.0 : 36.0
                    )
                    .offset(
                        x: (geometry.size.width / 2) - 20,
                        y: (geometry.size.height / -2) + 20
                    )
                    .padding(.top, widgetFamily != .systemSmall ? 32.0 : 12.0)
                    .padding(.trailing, widgetFamily != .systemSmall ? 32.0 : 12.0)
                HStack {
                    Text(entry.text)
                        .foregroundStyle(.white)
                        .font(fontStyle)
                        .fontWeight(.bold)
                        .padding(.horizontal, 12.0)
                        .padding(.vertical, 4.0)
                        .background(
                            Color.black.opacity(0.5)
                                .blendMode(.overlay)
                                .clipShape(.capsule)
                        )
                    if widgetFamily != .systemSmall {
                        Spacer()
                    }
                }.padding()
                    .offset(y: (geometry.size.height / 2) - 24)
            }.clipShape(.rect(cornerRadius: 16.0))
        }
    }
}

// MARK: - WIDGET
struct DevoteLauncherWidget: Widget {
    let kind: String = "DevoteLauncherWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: Provider()
        ) { entry in
            if #available(iOS 17.0, *) {
                DevoteLauncherWidgetEntryView(entry: entry)
                    .containerBackground(gradientBackground, for: .widget)
            } else {
                DevoteLauncherWidgetEntryView(entry: entry)
                    .background(
                        gradientBackground
                    )
            }
        }
        .configurationDisplayName("Devote Launcher")
        .description("This is the widget for Devote Todo application.")
    }
}

// MARK: - PREVIEWS
#Preview(as: .systemSmall) {
    DevoteLauncherWidget()
} timeline: {
    DevoteLauncherWidgetEntry(date: .now, text: "Just Do It")
    DevoteLauncherWidgetEntry(date: .now, text: "Let's Do It")
}

#Preview(as: .systemMedium) {
    DevoteLauncherWidget()
} timeline: {
    DevoteLauncherWidgetEntry(date: .now, text: "Just Do It")
    DevoteLauncherWidgetEntry(date: .now, text: "Let's Do It")
}

#Preview(as: .systemLarge) {
    DevoteLauncherWidget()
} timeline: {
    DevoteLauncherWidgetEntry(date: .now, text: "Just Do It")
    DevoteLauncherWidgetEntry(date: .now, text: "Let's Do It")
}

#Preview(as: .systemExtraLarge) {
    DevoteLauncherWidget()
} timeline: {
    DevoteLauncherWidgetEntry(date: .now, text: "Just Do It")
    DevoteLauncherWidgetEntry(date: .now, text: "Let's Do It")
}
