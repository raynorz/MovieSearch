//
//  CoreDataProtocols.swift
//  MovieSearchSample
//
//  Created by Daniel Brezina on 22/07/2020.
//  Copyright © 2020 Daniel Brezina. All rights reserved.
//

import Foundation
import CoreData

/// protocol for structs
/// means, that conforming struct is able to convert itself into data and creates specified managed object
protocol Saveble {
    func convertToData(_ managedObjectContext: NSManagedObjectContext)
}

/// protocol, signaling, that has a data component with encoded struct
protocol Loadable where Self: NSManagedObject {
    var data: Data? { get }
}

/// able to create predicate with id to delete from database
protocol Deletable where Self: NSManagedObject {
    static func idPredicate(idToDelete: String) -> NSPredicate
}
