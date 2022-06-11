//
//  SwiftUIView.swift
//  NaranjaXChallenge
//
//

import SwiftUI

struct NewsView: View {
    var result: Result
    
    var body: some View {
        VStack{
                    VStack{
                    Text("\(result.webPublicationDate)")
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                    Text("\(result.webTitle)")
                            .font(.title)
                    Text ("\(result.fields.headline)")
                            .font(.headline)
                    }
                    AsyncImage(url: URL(string: "\(result.fields.thumbnail)")) { image in
                            image.resizable()
                        } placeholder: {
                            Color.gray
                        }
                        .scaledToFit()
                        .padding(10)
                        .foregroundColor(.gray)
                    HTMLStringView(htmlContent: result.fields.body)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView(result: Result.example)
    }
}
