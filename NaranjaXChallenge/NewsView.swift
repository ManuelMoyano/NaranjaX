//
//  SwiftUIView.swift
//  NaranjaXChallenge
//
//  Created by Manuel Moyano on 09/06/2022.
//

import SwiftUI

struct NewsView: View {
    @State var result: Result
    
    var body: some View {
        VStack{
//                ScrollView {
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
//                    Text ("\(result.fields.body)")
//                        .multilineTextAlignment(.leading)
                    HTMLStringView(htmlContent: result.fields.body)
                        .font(.system(size: 10))
//                }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView(result: Result.example)
    }
}
