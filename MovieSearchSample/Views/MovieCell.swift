//
//  ImageCell.swift
//  ImageTracker
//
//  Created by Daniel Brezina on 08/07/2020.
//  Copyright © 2020 Daniel Brezina. All rights reserved.
//

import SwiftUI

struct MovieCell: View {
    var movie: Movie
    var body: some View {
        Text(movie.title)
    }
}

//struct ImageCell_Previews: PreviewProvider {
//    static var previews: some View {
//        ImageCell(image: Photo(id: "id", owner: "owner", secret: "secret", server: "server", farm: 0, title: "Title", ispublic: 1, isfriend: 1, isfamily: 1))
//    }
//}
