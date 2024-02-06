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
    
    private func onCreate() {
        viewModel.add(newHabit)
        showHabitForm = false
    }

    var body: some View {
        VStack {
//            createNewButton
            habitForm
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
        VStack(spacing: 0) {
            TextField("new habit name :p", text: $newHabit.name)
                .plainTextFieldStyle()
                .fontWeight(.bold)
            
            TextField("catch a fish THIS big <*|^=|>", text: $newHabit.description)
                .plainTextFieldStyle()

            addButton
            Spacer()
        }
        .background(AppColors.shared.risdBlue)
        .frame(width: 300, height: 400)
    }
               
    var createNewButton: some View {
        AddButton(action: { showHabitForm = true })
    }
    
    var addButton: some View {
        AddButton(action: { onCreate() },
                  foregroundColor: .white,
                  backgroundColor: AppColors.shared.orange)
        .disabled(!isValidNewHabit)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
