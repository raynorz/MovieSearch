//
//  ViewModel.swift
//  ImageTracker
//
//  Created by Daniel Brezina on 08/07/2020.
//  Copyright © 2020 Daniel Brezina. All rights reserved.
//

import Combine
import SwiftUI
import CoreLocation

final class MoviesViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    
    private let movieDataService: MovieDataServiceProtocol
    
    init(movieDataService: MovieDataServiceProtocol) {
        self.movieDataService = movieDataService
    }

    func fetch(movie: String) {
        movieDataService.searchMovie(byTitle: movie) { [weak self](result) -> (Void) in
            guard let self = self else { return }
            
            switch result {
            case .success(let newMovie):
                DispatchQueue.main.async {
                    self.movies.insert(newMovie, at: 0)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
