//
//  widget.swift
//  widget
//
//  Created by 譚培成 on 2024/6/30.
//

import WidgetKit
import SwiftUI

// 資料的 model
struct SimpleEntry: TimelineEntry {
    let date: Date
    let providerInfo: String
}

// 轉換成 Widget (把 view 跟 model 丟進去)
struct MyWidget: Widget {
    let kind: String = "wediget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: ViewSizeTimelineProvider()) { entry in
            WidgetEntryView(entry: entry)
        }
        .configurationDisplayName("View Size Widget")
        .description("This is a demo widget.")
        .supportedFamilies([
            .systemLarge,
        ])
    }
}

// 不同時間的時候 要給什麼畫面 (塞資料到 model)
struct ViewSizeTimelineProvider: TimelineProvider {
    typealias Entry = SimpleEntry
    
    // 預設
    func placeholder(in context: Context) -> Entry {
        return SimpleEntry(date: .now, providerInfo: "placeholder")
    }
    
    // 快照
    func getSnapshot(in context: Context, completion: @escaping (Entry) -> ()) {
        let entry = SimpleEntry(date: Date(), providerInfo: "snapshot")
            completion(entry)
    }
    
    // 真正運作的時候
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let value = (UserDefaults.appGroup.object(forKey: UserDefaults.keys.test) as? String) ?? "nil"
        let entry = SimpleEntry(date: Date(), providerInfo: value)
        let timeline = Timeline(entries: [entry], policy: .never)
        completion(timeline)
    }
}

#Preview(as: .systemMedium) {
    MyWidget()
} timeline: {
    SimpleEntry(date: .now, providerInfo: "1")
    SimpleEntry(date: .now, providerInfo: "2")
}
