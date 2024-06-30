//
//  AppIntent.swift
//  wediget
//
//  Created by ElijahTan on 2024/6/27.
//

import WidgetKit
import AppIntents



struct MyIntent: AppIntent {
    static var title: LocalizedStringResource = "MyIntent"
    
    init() {}

    func perform() async throws -> some IntentResult {
        // 發送 GET 請求到 google.com
        let url = URL(string: "https://www.google.com")!
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid response"])
        }
        // 處理返回的數據
        let result = String(data: data, encoding: .utf8) ?? "No data"
        print(result)
        
        
        UserDefaults.appGroup.set("test 7", forKey: UserDefaults.keys.test)
        
        return .result()
    }
}
