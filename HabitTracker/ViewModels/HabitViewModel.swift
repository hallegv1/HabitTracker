//
//  HabitViewModel.swift
//  HabitTracker
//
//  Created by Halle V` on 2/6/24.
//

import Foundation

final class HabitViewModel: ObservableObject {
    @Published var habits: [Habit]
    
    init() {
        self.habits = HTDefaults.shared.getAllHabits()
    }
    
    func getHabit(completion: @escaping ([Habit]?) -> Void) {
        completion(habits)
    }
    
    func add(_ habit: Habit) {
        HTDefaults.shared.setHabit(habit)
    }
    
    func remove(_ habit: Habit, completion: @escaping (Bool) -> Void) {
        HTDefaults.shared.removeHabit(habit) { res in
            completion(res)
        }
    }
}
