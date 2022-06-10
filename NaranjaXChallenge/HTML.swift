//
//  HTML.swift
//  NaranjaXChallenge
//
//  Created by Manuel Moyano on 10/06/2022.
//

//import SwiftUI
//import WebKit
//
//struct HTMLView: UIViewRepresentable {
//    let htmlString: String
//
//    func makeUIView(context: Context) -> WKWebView {
//        return WKWebView()
//    }
//    func updateUIView(_ uiView: WKWebView, context: Context) {
//        uiView.loadHTMLString(htmlString, baseURL: nil)
//    }
//
//}

import WebKit
import SwiftUI

struct HTMLStringView: UIViewRepresentable {
    let htmlContent: String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(htmlContent, baseURL: nil)
    }
}
