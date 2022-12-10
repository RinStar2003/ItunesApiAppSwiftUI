//
//  BuyButton.swift
//  iTunesSearchAPIAppSwiftUI
//
//  Created by мас on 10.12.2022.
//

import SwiftUI

struct BuyButton: View {
    
    let urlString: String
    let price: Double?
    let currency: String
    
    var body: some View {
        if let url = URL(string: urlString), let price = price {
            Link(destination: url) {
                Text("\(String(format: "%.2f", price)) \(currency)")
            }
            .buttonStyle(BuyButtonStyle())
        }
        
    }
}

struct BuyButton_Previews: PreviewProvider {
    static var previews: some View {
        
        let example = Song.example()
        
        BuyButton(urlString: example.previewURL, price: example.trackPrice, currency: example.currency)
    }
}
