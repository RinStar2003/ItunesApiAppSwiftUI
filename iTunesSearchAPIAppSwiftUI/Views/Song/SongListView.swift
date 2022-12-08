//
//  SongListView.swift
//  iTunesSearchAPIAppSwiftUI
//
//  Created by мас on 08.12.2022.
//

import SwiftUI

struct SongListView: View {
    
    @ObservedObject var viewModel: SongListViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.songs) { songs in
                Text(songs.trackName)
            }
            
            switch viewModel.state {
            case .good:
                Color.clear
                    .onAppear {
                        viewModel.loadMore()
                    }
            case .isLoading:
                ProgressView()
                    .progressViewStyle(.circular)
                    .frame(maxWidth: .infinity)
            case .loadedAll:
                // EmptyView()
                Color.gray
            case .error(let message):
                Text(message)
                    .foregroundColor(.red)
            }
            
        }
        .listStyle(.plain)
    }
}

struct SongListView_Previews: PreviewProvider {
    static var previews: some View {
        SongListView(viewModel: SongListViewModel())
    }
}
