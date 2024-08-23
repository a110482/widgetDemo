//
//  AppIntent.swift
//  DemoWidget
//
//  Created by ElijahTan on 2024/8/23.
//

import WidgetKit
import AppIntents

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Configuration"
    static var description = IntentDescription("This is an example widget.")
    
    static var val = 0
    var isSnapShot = false
    
    init() {
        print("ConfigurationAppIntent")
    }

    // An example configurable parameter.
    @Parameter(title: "Favorite Emoji", default: "0")
    var favoriteEmoji: String
    
    var favoriteEmojiValue: String {
        if isSnapShot {
            return "snp"
        }
        print("get val")
        return favoriteEmoji
    }
}
