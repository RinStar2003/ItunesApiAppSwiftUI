//
//  PlaceholderView.swift
//  iTunesSearchAPIAppSwiftUI
//
//  Created by мас on 09.12.2022.
//

import SwiftUI

struct SearchPlaceholderView: View {
    
    @Binding var searchTerm: String
    let suggestions = ["rammstein", "cry to me", "maneskin", "first aid kit", "sabaton"]
    
    var body: some View {
        VStack {
            
            Text("Trending")
                .font(.title)
            ForEach(suggestions, id: \.self) { text in
                Button {
                    searchTerm = text
                } label: {
                    Text(text)
                        .font(.title2)
                }
                .padding(.vertical, 10)
                
            }
        }
    }
}
