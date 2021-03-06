//
//  SearchMovieRouter.swift
//  MovieSearch
//
//  Created by Daniel Brezina on 09/07/2020.
//  Copyright © 2020 Daniel Brezina. All rights reserved.
//

import Foundation

/// Router enum that creates request URL for movie search with given parameters
enum SearchMovieRouter: APIRequestConventor {
    case searchMovie(title: String)
}

extension SearchMovieRouter {
    
    func createUrl() -> URL? {
        var urlComponents = baseURLComponents
        switch self {
        case .searchMovie(let title):
            urlComponents.queryItems?.append(URLQueryItem(name: URLComponentsConstants.title, value: title))
        }
        
        return urlComponents.url
    }
}
