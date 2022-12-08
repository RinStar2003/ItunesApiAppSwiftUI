//
//  ContentView.swift
//  iTunesSearchAPIAppSwiftUI
//
//  Created by мас on 06.12.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            AlbumSearchView()
                .tabItem {
                    Label("Albums", systemImage: "music.note.tv")
                }
            
            MovieSearchListView()
                .tabItem {
                    Label("Movies", systemImage: "film.fill")
                }
            
            SongSearchListView()
                .tabItem {
                    Label("Songs", systemImage: "music.quarternote.3")
                }
        }
    }
}

