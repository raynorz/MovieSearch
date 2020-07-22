//
//  MovieEntity+CoreDataClass.swift
//  MovieSearchSample
//
//  Created by Daniel Brezina on 22/07/2020.
//  Copyright © 2020 Daniel Brezina. All rights reserved.
//
//

import Foundation
import CoreData

@objc(MovieEntity)
public class MovieEntity: NSManagedObject {

}

extension MovieEntity: Loadable { }

extension MovieEntity: Deletable {
    static func idPredicate(idToDelete: String) -> NSPredicate {
        return NSPredicate(format: "movieName == %@", idToDelete)
    }
}
