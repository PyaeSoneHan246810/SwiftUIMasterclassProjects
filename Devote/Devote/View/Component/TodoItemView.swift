//
//  TodoItemView.swift
//  Devote
//
//  Created by Dylan on 09/12/2024.
//

import SwiftUI

struct TodoItemView: View {
    // MARK: - ENVIRONMENT
    @Environment(\.managedObjectContext) private var viewContext
    // MARK: - PROPERTIES
    @ObservedObject var todo: Todo
    // MARK: - BODY
    var body: some View {
        Toggle(isOn: $todo.isCompleted) {
            Text(todo.title ?? "")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(todo.isCompleted ? Color.pink : Color.primary)
        }.toggleStyle(CheckboxStyle())
            .onReceive(todo.objectWillChange) {
                if viewContext.hasChanges {
                    do {
                        try viewContext.save()
                    } catch {
                        let nsError = error as NSError
                        print(nsError.localizedDescription)
                    }
                }
            }
    }
}

struct CheckboxStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return HStack {
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                .font(.title)
                .foregroundStyle(configuration.isOn ? Color.pink : Color.primary)
            configuration.label
        }.frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 2.0)
            .contentShape(Rectangle())
            .onTapGesture {
                configuration.isOn.toggle()
                hapticFeedback.notificationOccurred(.success)
                if configuration.isOn {
                    playSound(sound: "sound-rise", type: "mp3")
                } else {
                    playSound(sound: "sound-tap", type: "mp3")
                }
            }
    }
}
