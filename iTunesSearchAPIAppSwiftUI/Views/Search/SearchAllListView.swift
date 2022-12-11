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

        ScrollView {
            LazyVStack {
                
                HStack {
                    Text("Albums")
                        .font(.title2)
                    Spacer()
                    NavigationLink {
                        AlbumListView(viewModel: albumListViewModel)
                    } label: {
                        HStack {
                            Text("See All")
                                .foregroundColor(.gray)
                                .font(.caption)
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                                .font(.caption)
                            
                        }
                    }
                }
                .padding(.horizontal)
                
                AlbumSectionView(albums: albumListViewModel.albums)
                
                Divider()
                    .padding(.bottom)
                
                HStack {
                    Text("Songs")
                        .font(.title2)
                    Spacer()
                    NavigationLink {
                        SongListView(viewModel: songListViewModel)
                    } label: {
                        HStack {
                            Text("See All")
                                .foregroundColor(.gray)
                                .font(.caption)
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                                .font(.caption)
                            
                        }
                    }
                }
                .padding(.horizontal)

                SongSectionView(songs: songListViewModel.songs)
                
                Divider()
                    .padding(.bottom)

                HStack {
                    Text("Movies")
                        .font(.title2)
                    Spacer()
                    NavigationLink {
                        MovieListView(viewModel: movieListViewModel)
                    } label: {
                        HStack {
                            Text("See All")
                                .foregroundColor(.gray)
                                .font(.caption)
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                                .font(.caption)
                            
                        }
                    }
                }
                .padding(.horizontal)
                
                MovieSectionView(movies: movieListViewModel.movies)
                
  
            }
        }
    }
}

struct SearchAllListView_Preview: PreviewProvider {
    static var previews: some View {
        SearchAllListView(albumListViewModel: AlbumListViewModel.example(), songListViewModel: SongListViewModel.example(), movieListViewModel: MovieListViewModel.example())
    }
}
