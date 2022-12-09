//
//  SearchAllListView.swift
//  iTunesSearchAPIAppSwiftUI
//
//  Created by мас on 09.12.2022.
//

import SwiftUI

struct SearchAllListView: View {
    
    @ObservedObject var albumListViewModel: AlbumListViewModel
    @ObservedObject var songListViewModel: SongListViewModel
    @ObservedObject var movieListViewModel: MovieListViewModel
    
    var body: some View {
        Text("Search all")
        
        Text("Movies: \(movieListViewModel.movies.count)")
        Text("Songs: \(songListViewModel.songs.count)")
        Text("Albums: \(albumListViewModel.albums.count)")

    }
}
