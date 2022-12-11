//
//  MovieSectionView.swift
//  iTunesSearchAPIAppSwiftUI
//
//  Created by мас on 11.12.2022.
//

import SwiftUI

struct MovieSectionView: View {
    
    let movies: [Movie]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(alignment: .top, spacing: 0) {
                ForEach(movies) { movie in
                    
                    VStack(alignment: .leading) {
                        ImageLoadingView(urlString: movie.artworkUrl100, size: 100)
                        Text(movie.trackName)
                        Text(movie.primaryGenreName)
                            .foregroundColor(.gray)
                    }
                    .lineLimit(2)
                    .frame(width: 80)
                    .font(.caption)
                }
            }
            .padding(.horizontal)

        }
    }
}

struct MovieSectionView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSectionView(movies: [Movie.example()])
    }
}
