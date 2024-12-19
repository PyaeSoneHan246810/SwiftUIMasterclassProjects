//
//  NewTodoItemView.swift
//  Devote
//
//  Created by Dylan on 09/12/2024.
//

import SwiftUI

struct NewTodoItemView: View {
    // MARK: - ENVIRONMENTS
    @Environment(\.colorScheme) private var colorScheme
    
    // MARK: - STATES
    @State private var todoTitle: String = ""
    @FocusState private var isTodoTitleFocused: Bool
    
    // MARK: - PROPERTIES
    let onSaveTodo: (String) -> Void
    let onDismiss: () -> Void
    
    // MARK: - COMPUTED PROPERTIES
    private var isButtonDisabled: Bool {
        todoTitle.trimmed().isEmpty
    }
    private var backgroundColor: Color {
        colorScheme == .dark ? Color.black : Color.gray
    }
    private var backgroundOpacity: Double {
        colorScheme == .dark ? 0.3 : 0.5
    }
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 16.0) {
                TextField(
                    "New Todo",
                    text: $todoTitle
                ).padding()
                    .background(
                        Color(UIColor.secondarySystemBackground)
                    )
                    .clipShape(.rect(cornerRadius: 8.0))
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(.pink)
                    .focused($isTodoTitleFocused)
                Button {
                    onSaveTodo(todoTitle.trimmed())
                    todoTitle = ""
                    isTodoTitleFocused = false
                } label: {
                    Spacer()
                    Text("Save")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(isButtonDisabled ? Color.secondary : Color.white)
                    Spacer()
                }.padding()
                    .background(isButtonDisabled ? Color(UIColor.systemFill) : Color.pink)
                    .clipShape(.rect(cornerRadius: 8.0))
                    .disabled(isButtonDisabled)
                    .onTapGesture {
                        if isButtonDisabled {
                            playSound(sound: "sound-tap", type: "mp3")
                        }
                    }
            }.padding(.horizontal, 16.0)
                .padding(.vertical, 16.0)
                .background(
                    Color(UIColor.systemBackground)
                )
                .clipShape(.rect(cornerRadius: 16.0))
                .shadow(color: .black.opacity(0.2), radius: 12.0)
                .frame(maxWidth: 640.0)
                .padding()
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                backgroundColor
                    .opacity(backgroundOpacity)
                    .blendMode(.overlay)
                    .ignoresSafeArea()
                    .onTapGesture {
                        onDismiss()
                    }
            )
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    NewTodoItemView(
        onSaveTodo: {_ in},
        onDismiss: {}
    ).background(
        ImageBackgroundView()
    )
}
