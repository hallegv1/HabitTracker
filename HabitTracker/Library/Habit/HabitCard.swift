//
//  HabitCard.swift
//  HabitTracker
//
//  Created by Halle V` on 2/21/24.
//

import SwiftUI

struct HabitCard: View {
    
    var habit: Habit
    
    var body: some View {
        VStack {
            Text("\(habit.name)")
                .font(.title)
               
            
            Text("\(habit.description)")
                .font(.subheadline)
            
            Spacer()
        }
        .padding(.vertical, 5)
        .frame(maxWidth: .infinity)
    }
    
}
