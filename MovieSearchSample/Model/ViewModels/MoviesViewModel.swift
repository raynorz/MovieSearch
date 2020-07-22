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
    private let coreData = CoreDataManager()
    
    init(movieDataService: MovieDataServiceProtocol) {
        self.movieDataService = movieDataService
    }
    
    func loadSavedMovies() {
        movies = coreData.fetch(entity: MovieEntity.self) ?? []
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
                self.coreData.save(structure: movie)
        }.store(in: &disposables)
    }
    
    func deleteMovies(at indexes: IndexSet) {
        indexes.forEach { index in
            self.coreData.delete(idToDelete: movies[index].title, type: MovieEntity.self)
            self.movies.remove(at: index)
        }
    }
}
