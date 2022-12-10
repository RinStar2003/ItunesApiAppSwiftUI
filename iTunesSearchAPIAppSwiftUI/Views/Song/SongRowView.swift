//
//  SongRowView.swift
//  iTunesSearchAPIAppSwiftUI
//
//  Created by мас on 10.12.2022.
//

import SwiftUI

struct SongRowView: View {
    
    let songs: Song
    
    var body: some View {
        
        HStack {
            
            ImageLoadingView(urlString: songs.artworkUrl60, size: 60)
            
            VStack(alignment: .leading) {
                Text(songs.trackName)
                Text(songs.artistName + " - " + songs.collectionName)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .lineLimit(1)
            
            Spacer(minLength: 20)
            
            BuyButton(urlString: songs.previewURL, price: songs.trackPrice, currency: songs.currency)
        }
    }
}


struct SongRowView_Previews: PreviewProvider {
    static var previews: some View {
        SongRowView(songs: Song.example())
    }
}
