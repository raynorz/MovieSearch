//
//  ContentView.swift
//  ImageTracker
//
//  Created by Daniel Brezina on 08/07/2020.
//  Copyright © 2020 Daniel Brezina. All rights reserved.
//

import SwiftUI
import CoreLocation

struct MoviesList: View {
    @EnvironmentObject var viewModel: MoviesViewModel
    
    var body: some View {
        VStack {
            InfoCell { (movie) -> (Void) in
                self.search(movie: movie)
            }
            List {
                ForEach(viewModel.movies, id: \.title) { movie in
                    MovieCell(movie: movie)
                }
            }
        }
    }
}

extension MoviesList {
    func search(movie: String) {
        viewModel.fetch(movie: movie)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
////        let viewModel = ViewModel(searchPhotoService: Sear)
////        return ImagesList().environmentObject(viewModel)
//    }
//}
