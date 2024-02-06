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
         foregroundColor: Color = Color(uiColor: UIColor.systemGray2),
         backgroundColor: Color = Color(uiColor: UIColor.systemGray6)
    ) {
        self.action = action
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
    }
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text("+")
                    .font(Font(.init(.system, size: 30)))
                    .fontWeight(.semibold)
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
