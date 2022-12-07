//
//  FetchState.swift
//  iTunesSearchAPIAppSwiftUI
//
//  Created by мас on 07.12.2022.
//

import Foundation

enum FetchState: Comparable {
    case good
    case isLoading
    case loadedAll
    case error(String)
}
