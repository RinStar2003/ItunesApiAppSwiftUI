//
//  MovieListViewModel.swift
//  iTunesSearchAPIAppSwiftUI
//
//  Created by мас on 07.12.2022.
//

import Foundation
import Combine


class MovieListViewModel: ObservableObject {
    
    @Published var searchTerm: String = ""
    @Published var movies: [Movie] = [Movie]()
    @Published var state: FetchState = .good
    
    let defaultLimits = 50
    
    let service = Service()
    
    var subscriptions = Set<AnyCancellable>()
    
    init() {
        
        $searchTerm
            .dropFirst()
            .removeDuplicates()
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .sink { [weak self] term in
                self?.state = .good
                self?.movies = []
                self?.fetchMovies(for: term)
            }.store(in: &subscriptions)
        
    }

    func fetchMovies(for searchTerm: String) {
        
        guard !searchTerm.isEmpty else { return }
        
        guard state == FetchState.good else { return }
        
        state = .isLoading
                
        service.fetchMovies(searchTerm: searchTerm) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                    
                case .success(let results):
                    self?.movies = results.results
                    
                    if results.resultCount == self?.defaultLimits {
                        self?.state = .good
                    } else {
                        self?.state = .loadedAll
                    }
                        
                        print("fetched \(results.resultCount) - \(results.results.count)")
                        
                    case .failure(let error):
                        print("Could not load data: \(error)")
                        self?.state = .error("Could not load: \(error.localizedDescription)")
                }
            }
        }
    }
    
    func loadMore() {
        fetchMovies(for: searchTerm)
    }
 
    static func example() -> MovieListViewModel {
        let vm = MovieListViewModel()
        vm.movies = [Movie.example()]
        return vm
    }
    
}

