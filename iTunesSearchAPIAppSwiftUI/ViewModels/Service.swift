//
//  Service.swift
//  iTunesSearchAPIAppSwiftUI
//
//  Created by мас on 07.12.2022.
//

import Foundation

enum EntityType: String {
    case album
    case song
    case movie
}

class Service {
    
    func fetchAlbums(searchTerm: String, page: Int, limit: Int, completion: @escaping (Result<AlbumResults, ApiError>) -> Void) {
        
        let url = createUrl(for: searchTerm, type: .album, page: page, limit: limit)
        
        fetch(type: AlbumResults.self, url: url, completion: completion)
        
    }
    
    func fetchSongs(searchTerm: String, page: Int, limit: Int, completion: @escaping (Result<SongResults, ApiError>) -> Void) {
        
        let url = createUrl(for: searchTerm, type: .song, page: page, limit: limit)
        
        fetch(type: SongResults.self, url: url, completion: completion)
    }
    
    func fetchMovies(searchTerm: String, completion: @escaping (Result<MovieResults, ApiError>) -> Void) {
        
        let url = createUrl(for: searchTerm, type: .movie, page: nil, limit: nil)
        
        fetch(type: MovieResults.self, url: url, completion: completion)
    }
    
    func fetch<T: Decodable>(type: T.Type, url: URL?, completion: @escaping (Result<T, ApiError>) -> Void) {
        
        guard let url = url else {
            let error = ApiError.badUrl
            completion(Result.failure(error))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error as? URLError {
                completion(Result.failure(ApiError.urlSession(error)))
            } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(ApiError.badResponse(response.statusCode)))
            } else if let data = data {
                
                do {
                    let result = try JSONDecoder().decode(type, from: data)
                    completion(Result.success(result))
                } catch {
                    completion(Result.failure(ApiError.decoding(error as? DecodingError)))
                }
            }
            
        }.resume()
    }
    
    
    func createUrl(for searchTerm: String, type: EntityType, page: Int?, limit: Int?) -> URL? {
        // https://itunes.apple.com/search?term=jack+johnson&entity=album&limit=5&offset=10
        
        let baseUrl = "https://itunes.apple.com/search"
                
        var queryItems = [URLQueryItem(name: "term", value: searchTerm),
                          URLQueryItem(name: "entity", value: type.rawValue)
                         ]
        
        if let page = page, let limit = limit {
            let offset = page * limit
            queryItems.append(URLQueryItem(name: "limit", value: String(limit)))
            queryItems.append(URLQueryItem(name: "offset", value: String(offset)))
        }
        
        var components = URLComponents(string: baseUrl)
        components?.queryItems = queryItems
        return components?.url
    }
}
