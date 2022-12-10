//
//  ImageLoadingView.swift
//  iTunesSearchAPIAppSwiftUI
//
//  Created by мас on 10.12.2022.
//

import SwiftUI

struct ImageLoadingView: View {
    
    let urlString: String
    let size: CGFloat
    
    var body: some View {
        AsyncImage(url: URL(string: urlString)) { image in
            image.resizable()
                 .border(Color(white: 0.8))
        } placeholder: {
            ProgressView()
        }
        .frame(width: size, height: size)
    }
}

struct ImageLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        ImageLoadingView(urlString: "", size: 100)
    }
}
