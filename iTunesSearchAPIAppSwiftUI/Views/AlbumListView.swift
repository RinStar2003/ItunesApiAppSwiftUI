//
//  AlbumListView.swift
//  iTunesSearchAPIAppSwiftUI
//
//  Created by мас on 06.12.2022.
//

import SwiftUI

struct AlbumListView: View {
    
    @StateObject var viewModel = AlbumListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.albums) { a in
                Text(a.collectionName)
            }
            .listStyle(.plain)
            .searchable(text: $viewModel.searchTerm)
            .navigationTitle("Search Albums")
        }
    }
}
