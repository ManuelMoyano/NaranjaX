//
//  SwiftUIView.swift
//  NaranjaXChallenge
//
//  Created by Manuel Moyano on 09/06/2022.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        VStack{
            GeometryReader { proxy in
                VStack {
                    Rectangle()
                        .frame(width: proxy.size.width, height: proxy.size.height/2)
                        .foregroundColor(.gray)
                    HStack {
                        Rectangle()
                            .frame(width: proxy.size.width/2, height: proxy.size.height/2)
                            .foregroundColor(.red)
                        Rectangle()
                            .frame(width: proxy.size.width/2, height: proxy.size.height/2)
                            .foregroundColor(.green)
                    }
                }

            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
