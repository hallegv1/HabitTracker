//
//  HTDefaults.swift
//  HabitTracker
//
//  Created by Halle V` on 2/7/24.
//

import Foundation

final class HTDefaults {
    
    static let shared = HTDefaults()
    
    private let habitsKey = "habit"
    
    func setHabit(_ habit: Habit) {
        var habits: [Habit] = getAllHabits()
        habits.append(habit)
        updateHabits(habits)
    }
    
    private func updateHabits(_ habits: [Habit]) {
        if let data = try? JSONEncoder().encode(habits) {
            UserDefaults.standard.set(data, forKey: habitsKey)
        }
    }
    
    func removeHabit(_ habit: Habit, completion: @escaping (Bool) -> Void) {
        var habits: [Habit] = getAllHabits()
        if let index = habits.firstIndex(where: { $0.name == habit.name }) {
            habits.remove(at: index)
            updateHabits(habits)
            completion(true)
        } else {
            completion(false)
        }
    }
    
    func getAllHabits() -> [Habit] {
        guard let data = UserDefaults.standard.data(forKey: habitsKey),
              let habits = try? JSONDecoder().decode([Habit].self, from: data) else {
            return []
        }
        return habits
    }
}
