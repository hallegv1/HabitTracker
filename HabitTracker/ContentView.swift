//
//  ContentView.swift
//  HabitTracker
//
//  Created by Halle V` on 2/6/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject var viewModel: HabitViewModel = HabitViewModel()
    @State var newHabit = Habit(name: "", description: "")
    @State var showHabitForm: Bool = false
    
    private var isValidNewHabit: Bool {
        !newHabit.name.isEmpty && !newHabit.description.isEmpty
    }
    
    private var habits: [Habit] {
        return viewModel.habits
    }

    var body: some View {
        VStack {
            createNewButton
            List {
                ForEach(habits) { habit in
                    Text("\(habit.name)")
                }
            }
        }
        .fullScreenCover(isPresented: $showHabitForm) {
            habitForm
        }
    }
    
    var habitForm: some View {
        VStack {
            TextField("Habit name", text: $newHabit.name)
            TextField("Habit description", text: $newHabit.description)
            addButton
        }
    }
               
    var createNewButton: some View {
        Button {
            showHabitForm = true
        } label: {
            Text("+")
        }
    }
    
    var addButton: some View {
        Button {
            viewModel.add(newHabit)
            showHabitForm = false
        } label: {
            Text("+")
        }
        .disabled(!isValidNewHabit)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
