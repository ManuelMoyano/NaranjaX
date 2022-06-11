//
//  ImageView.swift
//  NaranjaXChallenge
//
//  Created by Manuel Moyano on 11/06/2022.
//

import SwiftUI

struct ImageView: View {
    let stringURL: String
    
    var body: some View {
        AsyncImage(url: URL(string: "\(stringURL)")) { image in
            image.resizable()
        } placeholder: {
            Color.gray
        }
        .clipShape(RoundedRectangle(cornerRadius: 5))
        .scaledToFill()
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(stringURL: "StringURL")
    }
}
