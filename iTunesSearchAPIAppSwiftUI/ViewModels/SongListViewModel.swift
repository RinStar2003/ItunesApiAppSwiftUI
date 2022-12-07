//
//  SongListViewModel.swift
//  iTunesSearchAPIAppSwiftUI
//
//  Created by мас on 07.12.2022.
//

import Foundation

class SongListViewModel: ObservableObject {
    
    @Published var searchTerm: String = ""
    @Published var songs: [Song] = [Song]()
    @Published var state: FetchState = .good
    
    let service = Service()
    
    var limit: Int = 20
    var page: Int = 0
    
    func fetchSongs(for searchTerm: String) {
        
        guard !searchTerm.isEmpty else { return }
        
        guard state == FetchState.good else { return }
        
        let offset = page * limit
        
        service.fetchSongs(searchTerm: searchTerm, page: page, limit: limit) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let results):
                    for songs in results.results {
                        self?.songs.append(songs)
                    }
                    self?.page += 1
                    self?.state = (results.results.count == self?.limit) ? .good : .loadedAll
                    print("fetched \(results.resultCount)")
                case .failure(let error):
                    self?.state = .error("Could not load: \(error.localizedDescription)")
                }
            }
        }
    }
    
}