//
//  SearchView.swift
//  iTunesSearchAPIAppSwiftUI
//
//  Created by мас on 09.12.2022.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchTerm = ""
    @State private var selectedEntityType = EntityType.all
    
    @StateObject var albumViewModel = AlbumListViewModel()
    @StateObject var songViewModel = SongListViewModel()
    @StateObject var movieViewModel = MovieListViewModel()
    
    var body: some View {
        
        NavigationView {
            VStack {
                Picker("Select the media", selection: $selectedEntityType) {
                    ForEach(EntityType.allCases) { type in
                        Text(type.name())
                            .tag(type)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
          
                Divider()
                
                if searchTerm.count == 0 {
                    SearchPlaceholderView(searchTerm: $searchTerm)
                        .frame(maxHeight: .infinity)
                }
                else {
                    switch selectedEntityType {
                    case .all:
                        SearchAllListView(albumListViewModel: albumViewModel, songListViewModel: songViewModel, movieListViewModel: movieViewModel)
                            .onAppear {
                                albumViewModel.searchTerm = searchTerm
                                songViewModel.searchTerm = searchTerm
                                movieViewModel.searchTerm = searchTerm
                            }
                    case .album:
                        AlbumListView(viewModel: albumViewModel)
                            .onAppear {
                                albumViewModel.searchTerm = searchTerm
                            }
                    case .song:
                        SongListView(viewModel: songViewModel)
                            .onAppear {
                                songViewModel.searchTerm = searchTerm
                            }
                    case .movie:
                        MovieListView(viewModel: movieViewModel)
                            .onAppear {
                                movieViewModel.searchTerm = searchTerm
                            }
                    }
                }
                Spacer()
            }
            .searchable(text: $searchTerm)
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onChange(of: searchTerm) { newValue in
            
            switch selectedEntityType {
            case .all:
                albumViewModel.searchTerm = newValue
                songViewModel.searchTerm = newValue
                movieViewModel.searchTerm = newValue
            case .album:
                albumViewModel.searchTerm = newValue
            case .song:
                songViewModel.searchTerm = newValue
            case .movie:
                movieViewModel.searchTerm = newValue
            }
        }
    }
}
