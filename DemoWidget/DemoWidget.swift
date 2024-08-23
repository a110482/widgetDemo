//
//  DemoWidget.swift
//  DemoWidget
//
//  Created by ElijahTan on 2024/8/23.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationAppIntent())
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        // joanna: configuration 就是系統給你的緩存
        var conf = ConfigurationAppIntent()
        // 我家了 isSnapShot 以後 就可以控制要顯示啥了
        conf.isSnapShot = true
        return SimpleEntry(date: Date(), configuration: conf)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        print(#function)
        var entries: [SimpleEntry] = []

        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            ConfigurationAppIntent.val += 1
            let con = ConfigurationAppIntent()
            con.favoriteEmoji = String(ConfigurationAppIntent.val)
            
            let entryDate = Calendar.current.date(byAdding: .second, value: hourOffset, to: currentDate)!
            
            let entry = SimpleEntry(date: entryDate, configuration: con)
            entries.append(entry)
        }

        return Timeline(entries: entries, policy: .atEnd)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationAppIntent
}

struct DemoWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text("Time:")
            Text(entry.date, style: .time)
            
            Text("Favorite Emoji:")
            Text(entry.configuration.favoriteEmojiValue)
        }
    }
}

struct DemoWidget: Widget {
    let kind: String = "DemoWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            DemoWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
    }
}

extension ConfigurationAppIntent {
    fileprivate static var smiley: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "1"
        return intent
    }
    
    fileprivate static var starEyes: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "2"
        return intent
    }
}

#Preview(as: .systemSmall) {
    DemoWidget()
} timeline: {
    SimpleEntry(date: .now, configuration: .smiley)
    SimpleEntry(date: .now, configuration: .starEyes)
}
