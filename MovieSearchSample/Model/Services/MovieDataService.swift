//
//  MovieDataService.swift
//  ImageTracker
//
//  Created by Daniel Brezina on 09/07/2020.
//  Copyright © 2020 Daniel Brezina. All rights reserved.
//

import Foundation

protocol MovieDataServiceProtocol {
    func searchMovie(byTitle: String, completion: @escaping((Swift.Result<Movie, Error>) -> (Void)))
}

final class MovieDataService: MovieDataServiceProtocol {
    let apiManager: APIManager
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
}

extension MovieDataService {
    func searchMovie(byTitle title: String, completion: @escaping ((Result<Movie, Error>) -> (Void))) {
        guard let url = SearchMovieRouter.searchMovie(title: title).createUrl() else {
            completion(.failure(APIError.invalidURL))
            return
        }
        
        apiManager.request(url: url, completion: completion)
    }
}
