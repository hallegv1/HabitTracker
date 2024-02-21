//
//  HabitCard.swift
//  HabitTracker
//
//  Created by Halle V` on 2/21/24.
//

import SwiftUI

struct HabitCard: View {
    
    var habit: HabitEntity
    
    var body: some View {
        VStack {
            Text("\(habit.name ?? "")")
                .font(.title)
                .padding(.vertical, 10)
            
            Text("\(habit.desc ?? "")")
                .font(.subheadline)
        }
        .padding(.vertical, 20)
        .frame(maxWidth: .infinity)
    }
    
}

struct HabitCard_Previews: PreviewProvider {
    static var previews: some View {
        HabitCard(habit: HabitEntity())
    }
}
