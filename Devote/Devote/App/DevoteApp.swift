//
//  DevoteApp.swift
//  Devote
//
//  Created by Dylan on 09/12/2024.
//

import SwiftUI

@main
struct DevoteApp: App {
    private let coreDataProvider = CoreDataProvider.shared
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    var body: some Scene {
        WindowGroup {
            MainContentView()
                .environment(\.managedObjectContext, coreDataProvider.persistentContainer.viewContext)
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
