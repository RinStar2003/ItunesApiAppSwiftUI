//
//  Album.swift
//  iTunesSearchAPIAppSwiftUI
//
//  Created by мас on 06.12.2022.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let albumResults = try? newJSONDecoder().decode(AlbumResults.self, from: jsonData)

import Foundation

// MARK: - AlbumResults
struct AlbumResults: Codable {
    var resultCount: Int
    var results: [Album]
}

// MARK: - Result
struct Album: Codable, Identifiable {
    let wrapperType, collectionType: String
    let id: Int
    let artistID: Int
    let amgArtistID: Int?
    let artistName, collectionName, collectionCensoredName: String
    let artistViewURL: String?
    let collectionViewURL: String
    let artworkUrl60, artworkUrl100: String
    let collectionPrice: Double
    let collectionExplicitness: String
    let trackCount: Int
    let copyright, country, currency: String
    let releaseDate: String
    let primaryGenreName: String

    enum CodingKeys: String, CodingKey {
        case wrapperType, collectionType
        case artistID = "artistId"
        case id = "collectionId"
        case amgArtistID = "amgArtistId"
        case artistName, collectionName, collectionCensoredName
        case artistViewURL = "artistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case artworkUrl60, artworkUrl100, collectionPrice, collectionExplicitness, trackCount, copyright, country, currency, releaseDate, primaryGenreName
    }
}
