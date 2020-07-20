//
//  ViewModel.swift
//  MovieSearch
//
//  Created by Daniel Brezina on 08/07/2020.
//  Copyright © 2020 Daniel Brezina. All rights reserved.
//

import Combine
import SwiftUI

/// Basic view model, that calls movie search requests and holds all the data for the view
final class MoviesViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    
    private let movieDataService: MovieDataServiceProtocol
    private var disposables = Set<AnyCancellable>()
    
    init(movieDataService: MovieDataServiceProtocol) {
        self.movieDataService = movieDataService
    }

    func fetch(movie: String) {
        movieDataService.searchMovie(byTitle: movie)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { (value) in
                switch value {
                case .failure(let error):
                    print(error.errorDescription ?? "")
                case .finished:
                    break
                }
            }) { [weak self](movie) in
                guard let self = self else { return }
                self.movies.insert(movie, at: 0)
        }.store(in: &disposables)
    }
}
