//
//  CoreDataManager.swift
//  MovieSearchSample
//
//  Created by Daniel Brezina on 22/07/2020.
//  Copyright © 2020 Daniel Brezina. All rights reserved.
//

import Foundation
import CoreData

/// Simple Core Data Manager, that is able to handle save, fetch and delete from local database
class CoreDataManager {
    static let shared = CoreDataManager()
    
    private init() { }
    
    lazy var container: NSPersistentContainer! = {
        return NSPersistentContainer(name: "MovieSearchSample")
    }()
}

// MARK: - Setup
extension CoreDataManager {
    func setupCoreData(completion: (() -> Void)?) {
        loadPersistentStore {
            completion?()
        }
    }
}


// MARK: - Data handling
extension CoreDataManager {
    /// save given structure into database
    /// - Parameter structure: structure to be converted into managedObject and saved into database
    func save<T: Saveble>(structure: T) {
        structure.convertToData(container.viewContext)
        saveContext()
    }
    
    /// fetch desired entity
    /// - Parameter entity: entity to be fetch
    /// - Returns: array of a structures created from given entity
    func fetch<T: Loadable, S: Codable>(entity: T.Type) -> [S]? {
        let fetchRequest = T.fetchRequest()
        
        do {
            guard let fetchResult = try container.viewContext.fetch(fetchRequest) as? [T] else { return nil }
            let decoder = JSONDecoder()
            let result: [S] = fetchResult
                .filter { $0.data != nil }
                .compactMap { try? decoder.decode(S.self, from: $0.data!) }
            
            
            return result
        } catch {
            print(error.localizedDescription)
        }
        
        return nil
    }
    
    /// delete entity with given id
    /// - Parameters:
    ///   - id: id of entity to be delete
    ///   - type: entity type
    func delete<T: Deletable>(idToDelete id: String, type: T.Type) {
        do {
            let fetchRequest = T.fetchRequest()
            fetchRequest.predicate = type.idPredicate(idToDelete: id)
            let results = try container.viewContext.fetch(fetchRequest) as? [T]
            results?.forEach { [weak self]entity in
                guard let self = self else { return }
                self.container.viewContext.delete(entity)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}

private extension CoreDataManager {
    func loadPersistentStore(completion: @escaping () -> (Void)) {
        container.loadPersistentStores { (description, error) in
            guard error == nil else {
                fatalError("Could not load core data persistent store")
            }
            
            completion()
        }
    }
    
    func saveContext() {
        if container.viewContext.hasChanges {
            do {
                try container.viewContext.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
