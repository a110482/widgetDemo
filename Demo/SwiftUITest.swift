//
//  SwiftUITest.swift
//  Demo
//
//  Created by 譚培成 on 2024/6/30.
//

import SwiftUI

struct SwiftUITest: View {
    @State private var username: String = "test"
    
    var body: some View {
        VStack {
            TextField("Enter your username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
        }
    }
}

#Preview {
    SwiftUITest()
}
