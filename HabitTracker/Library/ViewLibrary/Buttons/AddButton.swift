//
//  AddButton.swift
//  HabitTracker
//
//  Created by Halle V` on 2/6/24.
//

import SwiftUI

struct AddButton: View {
    let foregroundColor: Color
    let backgroundColor: Color
    let action: () -> Void
    
    init(action: @escaping () -> Void,
         foregroundColor: Color = Color.white,
         backgroundColor: Color = Color.black
    ) {
        self.action = action
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
    }
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: "plus")
                    .font(Font(.init(.system, size: 24)))
                    .fontWeight(.heavy)
                    .foregroundColor(foregroundColor)
            }
        }
        .frame(width: 40, height: 40)
        .background(backgroundColor)
        .cornerRadius(15)
        .padding(5)
    }
}

struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        AddButton(action: {})
    }
}
