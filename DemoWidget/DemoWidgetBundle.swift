//
//  DemoWidgetBundle.swift
//  DemoWidget
//
//  Created by ElijahTan on 2024/8/23.
//

import WidgetKit
import SwiftUI

@main
struct DemoWidgetBundle: WidgetBundle {
    var body: some Widget {
        DemoWidget()
        DemoWidgetLiveActivity()
    }
}
