//
//  MovieRowView.swift
//  iTunesSearchAPIAppSwiftUI
//
//  Created by мас on 10.12.2022.
//

import SwiftUI

struct MovieRowView: View {
    
    let movie: Movie
    
    var body: some View {

        HStack {
            
            ImageLoadingView(urlString: movie.artworkUrl100, size: 100)
            VStack(alignment: .leading) {
                Text(movie.trackName)
                Text(movie.artistName)
                    .foregroundColor(.gray)
                Text(movie.releaseDate)
                    .foregroundColor(.gray)
            }
            .font(.caption)
            .lineLimit(1)
                        
            BuyButton(urlString: movie.previewURL ?? "",
                      price: movie.collectionPrice,
                      currency: movie.currency)
        }
    }
}

struct MovieRowView_Previews: PreviewProvider {
    static var previews: some View {
        MovieRowView(movie: Movie.example())
    }
}
