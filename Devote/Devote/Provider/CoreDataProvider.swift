//
//  CoreDataProvider.swift
//  Devote
//
//  Created by Dylan on 09/12/2024.
//

import CoreData
import Foundation

class CoreDataProvider {
    // MARK: - SINGLETON INSTANCE
    static let shared = CoreDataProvider()
    
    // MARK: - PERSISTENT CONTAINER
    let persistentContainer: NSPersistentContainer
    
    init() {
        // MARK: - INITIALIZATION OF PERSISTENT CONTAINER
        persistentContainer = NSPersistentContainer(name: "DevoteAppModel")
        
        // MARK: - LOADING PERSISTENT STORES
        persistentContainer.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Failed to load persistent stores: \(error)")
            }
        }
    }
}
