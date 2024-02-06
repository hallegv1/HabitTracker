//
//  HabitViewModel.swift
//  HabitTracker
//
//  Created by Halle V` on 2/6/24.
//

import Foundation

final class HabitViewModel: ObservableObject {
    @Published var habits: [Habit] = []
    
    func getHabit(completion: @escaping ([Habit]?) -> Void) {
        completion(habits)
    }
    
    func add(_ habit: Habit) {
        habits.append(habit)
    }
    
    func remove(_ habit: Habit, completion: @escaping (Bool) -> Void) {
        if let index = habits.firstIndex(where: { $0.id == habit.id }) {
            habits.remove(at: index)
            completion(true)
        } else {
            completion(false)
        }
    }
}
