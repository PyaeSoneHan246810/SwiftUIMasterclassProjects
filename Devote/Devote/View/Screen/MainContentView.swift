//
//  MainContentView.swift
//  Devote
//
//  Created by Dylan on 09/12/2024.
//

import CoreData
import SwiftUI

struct MainContentView: View {
    // MARK: - ENVIRONMENT
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.colorScheme) private var colorScheme
    
    // MARK: - APP STORAGE
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    // MARK: - CORE DATA FETCHED RESULTS
    @FetchRequest(
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Todo.timestamp, ascending: true)
        ],
        predicate: nil,
        animation: .default
    )
    private var todos: FetchedResults<Todo>
    
    // MARK: - STATES
    @State private var showNewTodoItem: Bool = false
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            ZStack {
                // MAIN CONTENT
                VStack {
                    // HEADER
                    HStack {
                        // TITLE
                        Text("Devote")
                            .font(.system(.largeTitle, design: .rounded))
                            .fontWeight(.heavy)
                            .foregroundStyle(.white)
                        Spacer()
                        HStack {
                            // EDIT BUTTON
                            EditButton()
                                .font(.system(size: 16.0, design: .rounded))
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                                .padding(.horizontal, 10.0)
                                .frame(minWidth: 70.0, minHeight: 24.0)
                                .background(
                                    Capsule()
                                        .stroke(.white, lineWidth: 2.0)
                                    
                                )
                            //DARK MODE BUTTON
                            Button {
                                isDarkMode.toggle()
                                playSound(sound: "sound-tap", type: "mp3")
                                hapticFeedback.notificationOccurred(.success)
                            } label: {
                                Image(systemName: colorScheme == .dark ? "moon.circle.fill" : "moon.circle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24.0, height: 24.0)
                                    .foregroundStyle(.white)
                            }
                        }
                    }.padding()
                    // NEW TODO BUTTON
                    NewTodoButton {
                        showNewTodoItem = true
                        playSound(sound: "sound-ding", type: "mp3")
                        hapticFeedback.notificationOccurred(.success)
                    }
                    // TODO LIST
                    List {
                        ForEach(todos) { todo in
                            TodoItemView(todo: todo)
                        }.onDelete { indexSet in
                            indexSet.forEach { index in
                                let todo = todos[index]
                                deleteTodo(todo)
                            }
                        }.listRowSeparator(.visible)
                    }.scrollContentBackground(.hidden)
                        .shadow(color: .black.opacity(0.2), radius: 12.0)
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                    .blur(radius: showNewTodoItem ? 8.0 : 0.0, opaque: false)
                    .transition(.move(edge: .bottom))
                    .animation(.easeOut(duration: 0.5), value: showNewTodoItem)
                // NEW TODO BOX
                if showNewTodoItem {
                    NewTodoItemView(
                        onSaveTodo: { title in
                            addTodo(title: title)
                            showNewTodoItem = false
                            playSound(sound: "sound-ding", type: "mp3")
                            hapticFeedback.notificationOccurred(.success)
                        },
                        onDismiss: {
                            showNewTodoItem = false
                        }
                    )
                }
            }.background(
                // IMAGE & GRADIENT BACKGROUND
                ImageBackgroundView()
                    .blur(radius: showNewTodoItem ? 8.0 : 0.0, opaque: false)
            )
        }
    }
    
    // MARK: - FUNCTIONS
    private func addTodo(title: String) {
        let todo = Todo(context: viewContext)
        todo.id = UUID()
        todo.title = title
        todo.timestamp = .now
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            print(nsError.localizedDescription)
        }
    }
    
    private func deleteTodo(_ todo: Todo) {
        viewContext.delete(todo)
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            print(nsError.localizedDescription)
        }
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    let coreDataProvider = CoreDataProvider.shared
    MainContentView()
        .environment(\.managedObjectContext, coreDataProvider.persistentContainer.viewContext)
}
