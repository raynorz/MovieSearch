//
//  AppDIContainer.swift
//  MovieSearchSample
//
//  Created by Daniel Brezina on 22/07/2020.
//  Copyright © 2020 Daniel Brezina. All rights reserved.
//

import Foundation
import Swinject

final class AppDIContainer {
    static let assembler = Assembler()
    
    static func resolveObject<T>(_ type: T.Type) -> T {
        guard let resolvedObject = assembler.resolver.resolve(type) else {
            fatalError("Could not resolve service \(type)")
        }
        
        return resolvedObject
    }
}
