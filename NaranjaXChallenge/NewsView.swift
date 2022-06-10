//
//  SwiftUIView.swift
//  NaranjaXChallenge
//
//  Created by Manuel Moyano on 09/06/2022.
//

import SwiftUI

struct SwiftUIView: View {
    @State var result: Result
    
    var body: some View {
        VStack{
            GeometryReader { proxy in
                VStack {
                    HStack{
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
                        .padding(10)
                        .frame(width: proxy.size.width, height: proxy.size.height/2)
                        .foregroundColor(.gray)
//                    Text ("\(result.fields.body)")
                }

            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView(result: Result.example)
    }
}
