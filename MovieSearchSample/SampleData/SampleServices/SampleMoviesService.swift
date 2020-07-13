//
//  SampleMoviesService.swift
//  MovieSearchSample
//
//  Created by Daniel Brezina on 10/07/2020.
//  Copyright © 2020 Daniel Brezina. All rights reserved.
//

import Foundation

final class SampleMoviesService: MovieDataServiceProtocol {
    let apiManager: APIManager
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
}

extension SampleMoviesService {
    func searchMovie(byTitle: String, completion: @escaping ((Result<Movie, Error>) -> (Void))) {
        let url = URL(string: "")!
        apiManager.request(url: url, completion: completion)
        
    }
}
