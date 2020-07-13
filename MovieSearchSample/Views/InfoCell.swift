//
//  InfoCell.swift
//  ImageTracker
//
//  Created by Daniel Brezina on 08/07/2020.
//  Copyright © 2020 Daniel Brezina. All rights reserved.
//

import SwiftUI

struct InfoCell: View {
    var search: (_ movie: String) -> (Void)
    @State private var movie: String = ""
    var body: some View {
        HStack {
            TextField("Movie", text: $movie)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Spacer()
            Button(action: {
                self.search(self.movie)
            }) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.blue)
            }
            .padding()
        }
    }
}

struct InfoCell_Previews: PreviewProvider {
    static var previews: some View {
        InfoCell { (movie) -> (Void) in
            print(movie)
        }
    }
}
