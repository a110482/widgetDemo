//
//  WidgetEntryView.swift
//  Demo
//
//  Created by 譚培成 on 2024/6/30.
//

import SwiftUI

// view 的外觀
struct WidgetEntryView : View {
    var entry: SimpleEntry
    var body: some View {
        VStack(alignment: .leading) {
            Button("bbb", intent: MyIntent())
            Text(entry.providerInfo)
        }
        .containerBackground(.clear, for: .widget)
    }
}
