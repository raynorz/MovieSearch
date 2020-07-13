//
//  MovieDetail.swift
//  MovieSearch
//
//  Created by Daniel Brezina on 10/07/2020.
//  Copyright © 2020 Daniel Brezina. All rights reserved.
//

import SwiftUI

struct MovieDetail: View {
    let movie: Movie
    var body: some View {
        VStack {
            Text(movie.title)
                .font(.headline)
                
            Text(movie.year)
                .font(.subheadline)
                .foregroundColor(Color.gray)
            HStack {
                Text(movie.released)
                    .fontWeight(.light)
                Spacer()
                Text(movie.runtime)
                    .fontWeight(.light)
            }
                .padding()
            
            HStack {
                Text(movie.ratings[0].value)
                    .fontWeight(.light)
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                Spacer()
                Text(movie.boxOffice)
                    .fontWeight(.light)
            }
                .padding()
            
            Text(movie.plot)
            Spacer()
        }
        
    }
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(movie: sampleMoviesData[0])
    }
}
