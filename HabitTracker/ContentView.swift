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
    
    private func onCreate() {
        viewModel.add(newHabit)
        showHabitForm = false
    }
    
    var body: some View {
        NavigationStack {
            appBar
            List {
                ForEach(viewModel.habits) { habit in
                    habitItem(habit)
                }
                .onDelete(perform: viewModel.deleteHabit)
            }
            .listStyle(.automatic)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .sheet(isPresented: $showHabitForm) {
            habitForm
        }
    }
    
    var appBar: some View {
        HStack {
            createNewButton
        }
        .padding(10)
        .frame(maxWidth: .infinity)
        .background(AppColors.shared.risdBlue)
    }
    
    func habitItem(_ habit: HabitEntity) -> some View {
        HabitCard(habit: habit)
//            .onTapGesture {
//                viewModel.updateHabit(habit)
//            }
    }
    
    private func delete(_ habit: HabitEntity) {
        print("IMPLEMENT DELETE")
    }
    
    var habitForm: some View {
        VStack(spacing: 10) {
            Spacer()
            Text("New Habit")
                .font(Font(.init(.system, size: 36)))
                .fontWeight(.heavy)
                .foregroundColor(AppColors.shared.hotPink)
            
            TextField("new habit name :p", text: $newHabit.name)
                .plainTextFieldStyle()
                .fontWeight(.bold)
            
            TextField("catch a fish THIS big <*|^=|>", text: $newHabit.description)
                .plainTextFieldStyle()
            
            addButton
            Spacer()
        }
        .background(AppColors.shared.risdBlue)
    }
    
    var createNewButton: some View {
        AddButton(action: { showHabitForm = true })
    }
    
    var addButton: some View {
        AddButton(action: { onCreate() },
                  foregroundColor: AppColors.shared.hotPink,
                  backgroundColor: .white)
        .disabled(!isValidNewHabit)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
