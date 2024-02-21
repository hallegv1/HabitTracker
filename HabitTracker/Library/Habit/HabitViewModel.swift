//
//  HabitViewModel.swift
//  HabitTracker
//
//  Created by Halle V` on 2/6/24.
//

import CoreData

final class HabitViewModel: ObservableObject {
    @Published var habits: [HabitEntity] = []
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "HabitsContainer")
        container.loadPersistentStores { (desc, err) in
            if let err = err {
                print("Error loading CoreData: \(err)")
            }
        }
        
        fetchHabits()
    }
    
    func fetchHabits() {
        let req = NSFetchRequest<HabitEntity>(entityName: "HabitEntity")
        
        do {
            habits = try container.viewContext.fetch(req)
        } catch let err {
            print("Error fetching HabitEntity \(err)")
        }
        
    }
    
    func add(_ habit: Habit) {
        let newHabit = HabitEntity(context: container.viewContext)
        newHabit.name = habit.name
        newHabit.desc = habit.description
        newHabit.id = habit.id
        
        if let firstDate = habit.completions.first {
            newHabit.completions = firstDate
        }
        
        saveData()
    }
    
    func updateHabit(_ habit: HabitEntity, _ newName: String? = nil, _ newDesc: String? = nil) {
        if let newName = newName {
            habit.name = newName
        }
        
        if let newDesc = newDesc {
            habit.desc = newDesc
        }
        
        saveData()
    }
    
    func deleteHabit(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = habits[index]
        container.viewContext.delete(entity)
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchHabits()
        } catch let err {
            print("Error saving data: \(err)")
        }
    }
}
