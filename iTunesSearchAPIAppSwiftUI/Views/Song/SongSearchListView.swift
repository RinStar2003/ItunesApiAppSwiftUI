//
//  SongSearchListView.swift
//  iTunesSearchAPIAppSwiftUI
//
//  Created by мас on 08.12.2022.
//

import SwiftUI

struct SongSearchListView: View {
    
    @StateObject private var viewModel = SongListViewModel()
    
    var body: some View {
        NavigationView {
            
            Group {
                if viewModel.searchTerm.isEmpty {
                    SearchPlaceholderView(searchTerm: $viewModel.searchTerm)
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
