//
//  MovieDataService.swift
//  MovieSearch
//
//  Created by Daniel Brezina on 09/07/2020.
//  Copyright © 2020 Daniel Brezina. All rights reserved.
//

import Foundation
import Combine

/// Protocol for service that handles movie search on OMDB
protocol MovieDataServiceProtocol {
    func searchMovie(byTitle: String) -> AnyPublisher<Movie, APIError>
//    func searchMovie(byTitle: String, completion: @escaping((Swift.Result<Movie, Error>) -> (Void)))
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
    func searchMovie(byTitle title: String) -> AnyPublisher<Movie, APIError> {
        guard let url = SearchMovieRouter.searchMovie(title: title).createUrl() else { return Fail(error: APIError.invalidURL).eraseToAnyPublisher() }
        
        return apiManager.request(url: url)
    }
}
