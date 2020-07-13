//
//  MovieDataService.swift
//  MovieSearch
//
//  Created by Daniel Brezina on 09/07/2020.
//  Copyright © 2020 Daniel Brezina. All rights reserved.
//

import Foundation

/// Protocol for service that handles movie search on OMDB
protocol MovieDataServiceProtocol {
    func searchMovie(byTitle: String, completion: @escaping((Swift.Result<Movie, Error>) -> (Void)))
}

/// Implementation of MovieDataServiceProtocol
/// service sends request into injected APIManager
final class MovieDataService: MovieDataServiceProtocol {
    let apiManager: APIManager
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
}

extension MovieDataService {
    /// search movie on OMDB with given title
    /// - Parameters:
    ///   - title: title of the movie
    ///   - completion: Swift Result with Movie data type
    func searchMovie(byTitle title: String, completion: @escaping ((Result<Movie, Error>) -> (Void))) {
        guard let url = SearchMovieRouter.searchMovie(title: title).createUrl() else {
            completion(.failure(APIError.invalidURL))
            return
        }
        
        apiManager.request(url: url, completion: completion)
    }
}
