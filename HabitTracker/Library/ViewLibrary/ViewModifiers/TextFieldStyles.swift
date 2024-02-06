//
//  TextFieldStyles.swift
//  HabitTracker
//
//  Created by Halle V` on 2/6/24.
//

import SwiftUI

struct PlainTextFieldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
    }
}

extension TextField {
    func plainTextFieldStyle() -> some View {
        self.modifier(PlainTextFieldStyle())
    }
}

