//
//  AlbumListViewModel.swift
//  iTunesSearchAPIAppSwiftUI
//
//  Created by мас on 06.12.2022.
//

import Foundation
import Combine

// https://itunes.apple.com/search?term=jack+johnson&entity=album&limit=5
// https://itunes.apple.com/search?term=jack+johnson&entity=song&limit=5
// https://itunes.apple.com/search?term=jack+johnson&entity=movie&limit=5

class AlbumListViewModel: ObservableObject {
    
    @Published var searchTerm: String = ""
    @Published var albums: [Album] = [Album]()
    
    var limit = 20
    
    var subscriptions = Set<AnyCancellable>()
    
    init() {
        
        $searchTerm
            .dropFirst()
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .sink { [weak self] term in
            self?.fetchAlbums(for: term)
        }.store(in: &subscriptions)
        
    }
    
    func fetchAlbums(for searchTerm: String) {
    
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(searchTerm)&entity=album&limit=\(limit)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                
                do {
                    let decodedData = try JSONDecoder().decode(AlbumResults.self, from: data)
                    DispatchQueue.main.async {
                        self.albums = decodedData.results
                    }
                }
                catch {
                    print("decoding data, \(error)")
                }
            }
        }
        .resume()
    }
}
