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
                    Text("\(result.webPublicationDate)")
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                    Text("\(result.webTitle)")
                            .font(.title)
                    Text ("\(result.fields.headline)")
                            .font(.headline)
                    ImageView(stringURL: result.fields.thumbnail)
                    HTMLStringView(htmlContent: result.fields.body)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView(result: Result.example)
    }
}
