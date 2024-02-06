//
//  Habit.swift
//  HabitTracker
//
//  Created by Halle V` on 2/6/24.
//

import Foundation

struct Habit: Identifiable {
    let id: UUID
    var name, description: String
    var completions: [Date]
    
    init(name: String, description: String) {
        self.id = UUID()
        self.name = name
        self.description = description
        self.completions = []
    }
}
