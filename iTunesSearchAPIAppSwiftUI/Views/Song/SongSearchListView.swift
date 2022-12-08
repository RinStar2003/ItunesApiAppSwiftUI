//
//  SongSearchListView.swift
//  iTunesSearchAPIAppSwiftUI
//
//  Created by мас on 08.12.2022.
//

import SwiftUI

struct SongSearchListView: View {
    
    @State private var viewModel = SongListViewModel()
    
    var body: some View {
        NavigationView {
            
            Group {
                if viewModel.searchTerm.isEmpty {
                    AlbumPlaceholderView(searchTerm: $viewModel.searchTerm)
                } else {
                    SongListView(viewModel: viewModel)
                }
            }
            .searchable(text: $viewModel.searchTerm)
            .navigationTitle("Search Songs")
        }
    }
}

struct SongSearchListView_Previews: PreviewProvider {
    static var previews: some View {
        SongSearchListView()
    }
}
