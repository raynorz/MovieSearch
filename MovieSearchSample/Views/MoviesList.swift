//
//  ContentView.swift
//  MovieSearch
//
//  Created by Daniel Brezina on 08/07/2020.
//  Copyright © 2020 Daniel Brezina. All rights reserved.
//

import SwiftUI
import CoreLocation

struct MoviesList: View {
    @EnvironmentObject var viewModel: MoviesViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                InfoCell { (movie) -> (Void) in
                    self.search(movie: movie)
                }
                List {
                    ForEach(viewModel.movies, id: \.title) { movie in
                        NavigationLink(destination: MovieDetail(movie: movie)) {
                            MovieCell(movie: movie)
                        }
                    }
                    .onDelete(perform: removeMovies(at:))
                }
            }
        .navigationBarTitle(Text("Search a movie"))
        }.onAppear {
            self.viewModel.loadSavedMovies()
        }
    }
}

extension MoviesList {
    func search(movie: String) {
        viewModel.fetch(movie: movie)
    }
    
    func removeMovies(at indexes: IndexSet) {
        viewModel.deleteMovies(at: indexes)
    }
}

struct MoviesList_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MoviesViewModel(movieDataService: SampleMoviesService(apiManager: SampleAPIManager()))
        viewModel.movies = sampleMoviesData
        return MoviesList().environmentObject(viewModel)
    }
}
