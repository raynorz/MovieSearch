//
//  SampleMoviesService.swift
//  MovieSearchSample
//
//  Created by Daniel Brezina on 10/07/2020.
//  Copyright © 2020 Daniel Brezina. All rights reserved.
//

import Foundation
import Combine

final class SampleMoviesService: MovieDataServiceProtocol {
    let apiManager: APIManager
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
}

extension SampleMoviesService {
    func searchMovie(byTitle: String) -> AnyPublisher<Movie, APIError> {
        let url = URL(string: "")!
        return apiManager.request(url: url)
    }
}
