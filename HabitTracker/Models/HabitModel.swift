//
//  HabitModel.swift
//  HabitTracker
//
//  Created by Halle V` on 2/7/24.
//

import Foundation

struct Habit: Identifiable, Codable {
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
