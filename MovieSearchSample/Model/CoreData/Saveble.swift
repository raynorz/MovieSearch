//
//  Saveble.swift
//  MovieSearchSample
//
//  Created by Daniel Brezina on 22/07/2020.
//  Copyright © 2020 Daniel Brezina. All rights reserved.
//

import Foundation
import CoreData

protocol Saveble {
    func convertToData(_ managedObjectContext: NSManagedObjectContext)
}
