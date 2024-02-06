//
//  Habit.swift
//  HabitTracker
//
//  Created by Halle V` on 2/6/24.
//

import Foundation

struct Habit: Identifiable {
    let id, name, description: String
    let completions: [Date]
}
