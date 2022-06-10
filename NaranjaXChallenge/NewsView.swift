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
            GeometryReader { proxy in
                ScrollView {
                    VStack{
                    Text("\(result.webTitle)")
                            .font(.title)
                    Text("\(result.webPublicationDate)")
                            .font(.footnote)
                    }
//                    Text ("\(result.fields.headLine)")
                    AsyncImage(url: URL(string: "\(result.fields.thumbnail)")) { image in
                            image.resizable()
                        } placeholder: {
                            Color.gray
                        }
                        .scaledToFit()
                        .padding(10)
                        .foregroundColor(.gray)
                    Text ("\(result.fields.body)")
                        .multilineTextAlignment(.leading)
                }

            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView(result: Result.example)
    }
}
