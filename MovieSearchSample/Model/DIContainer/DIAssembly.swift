//
//  DIAssembly.swift
//  MovieSearchSample
//
//  Created by Daniel Brezina on 22/07/2020.
//  Copyright © 2020 Daniel Brezina. All rights reserved.
//

import Foundation
import Swinject

final class DIAssembly: Assembly {
    func assemble(container: Container) {
        registerApiManagers(container: container)
        registerServices(container: container)
        registerViewModels(container: container)
    }
}

// API Manager
private extension DIAssembly {
    func registerApiManagers(container: Container) {
        container.register(APIManager.self) { resolver in
            ServerCommunication()
        }
    }
}

// MARK: - Services
private extension DIAssembly {
    func registerServices(container: Container) {
        container.register(MovieDataServiceProtocol.self) { resolver in
            MovieDataService(apiManager: resolver.resolve(APIManager.self)!)
        }
    }
}

private extension DIAssembly {
    func registerViewModels(container: Container) {
        container.register(MoviesViewModel.self) { resolver in
            MoviesViewModel(movieDataService: resolver.resolve(MovieDataServiceProtocol.self)!)
        }
    }
}
