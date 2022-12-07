//
//  ErrorHandler.swift
//  iTunesSearchAPIAppSwiftUI
//
//  Created by мас on 07.12.2022.
//

import Foundation

enum ApiError: Error, CustomStringConvertible {
    case badUrl
    case urlSession(URLError?)
    case badResponse(Int)
    case decoding(DecodingError?)
    case unknown
    
    var description: String {
        switch self {
        case .badUrl:
            return "Bad URL"
        case .urlSession(let error):
            return "urlSession error: \(error?.localizedDescription)"
        case .badResponse(let statusCode):
            return "Bad response with status code: \(statusCode)"
        case .decoding(let decodingError):
            return "Decoding Error: \(decodingError)"
        case .unknown:
            return "Unknown error ocured"
        }
    }

    var localizedDescription: String {
        switch self {
        case .badUrl, .unknown:
            return "something went wrong"
        case .urlSession(let urlError):
            return urlError?.localizedDescription ?? "Something went wrong"
        case .badResponse(let int):
            return "Something went wrong, \(int)"
        case .decoding(let decodingError):
            return decodingError?.localizedDescription ?? "???"
            
        }
    }
    
}
