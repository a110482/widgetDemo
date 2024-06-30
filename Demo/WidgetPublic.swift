//
//  WidgetPublic.swift
//  Demo
//
//  Created by 譚培成 on 2024/6/30.
//

import Foundation

extension UserDefaults {
    static let appGroup = UserDefaults(suiteName: "group.com.widget.elijah")!
}

extension UserDefaults {
    enum keys {
        static var test: String { #function }
    }
}
