//
//  ImageCell.swift
//  MovieSearch
//
//  Created by Daniel Brezina on 08/07/2020.
//  Copyright © 2020 Daniel Brezina. All rights reserved.
//

import SwiftUI

struct MovieCell: View {
    var movie: Movie
    var body: some View {
        Text(movie.title)
            .multilineTextAlignment(.leading)
    }
}

struct MovieCell_Previews: PreviewProvider {
    static var previews: some View {
        MovieCell(movie: sampleMoviesData[0])
    }
}
