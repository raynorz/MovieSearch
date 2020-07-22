//
//  ViewModel.swift
//  MovieSearch
//
//  Created by Daniel Brezina on 08/07/2020.
//  Copyright © 2020 Daniel Brezina. All rights reserved.
//

import Combine
import SwiftUI

/// Basic view model, that calls movie search requests and holds all the data for the view and handles persistance of data
final class MoviesViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var showAlert = false
    
    private let movieDataService: MovieDataServiceProtocol
    private let coreDataManager: CoreDataManager = CoreDataManager.shared
    private var disposables = Set<AnyCancellable>()
    
    init(movieDataService: MovieDataServiceProtocol) {
        self.movieDataService = movieDataService
    }
    
    func loadSavedMovies() {
        movies = coreDataManager.fetch(entity: MovieEntity.self) ?? []
    }

    func fetch(movie: String) {
        movieDataService.searchMovie(byTitle: movie)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self](value) in
                guard let self = self else { return }
                switch value {
                case .failure:
                    self.showAlert = true
                case .finished:
                    break
                }
            }) { [weak self](movie) in
                guard let self = self else { return }
                self.movies.insert(movie, at: 0)
                self.coreDataManager.save(structure: movie)
        }.store(in: &disposables)
    }
    
    func deleteMovies(at indexes: IndexSet) {
        indexes.forEach { index in
            self.coreDataManager.delete(idToDelete: movies[index].title, type: MovieEntity.self)
            self.movies.remove(at: index)
        }
    }
}
