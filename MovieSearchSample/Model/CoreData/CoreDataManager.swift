//
//  CoreDataManager.swift
//  MovieSearchSample
//
//  Created by Daniel Brezina on 22/07/2020.
//  Copyright © 2020 Daniel Brezina. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
    var container: NSPersistentContainer!
    
    init() {
        container = NSPersistentContainer(name: "MovieSearchSample")
        
        container.loadPersistentStores { (storeDescription, error) in
            guard error == nil else {
                print(error?.localizedDescription)
                return
            }
            
            
        }
    }
}

extension CoreDataManager {
    func save<T: Saveble>(structure: T) {
        structure.convertToData(container.viewContext)
        saveContext()
    }
    
    func fetch<T: NSManagedObject & Loadable, S: Codable>(entity: T.Type) -> [S]? {
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
}

private extension CoreDataManager {
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
