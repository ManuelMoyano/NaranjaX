//
//  Response.swift
//  NaranjaXChallenge
//
//  Created by Manuel Moyano on 06/06/2022.
//

import Foundation
import WebKit
import SwiftUI


struct EndpointResponse: Codable {
    var response: Response
    
    static let example = EndpointResponse(response: Response.example)
}

struct Response: Codable {
    var status: String
    var userTier: String
    var total: Int
    var startIndex:Int
    var pageSize:Int
    var currentPage:Int
    var pages:Int
    var orderBy:String
    var results = [Result]()
    
//    init(status:String, userTier: String, total: Int, startIndex: Int, pageSize:Int, currentPage: Int, pages: Int, orderBy: String) {
//        self.status = status
//        self.userTier = userTier
//        self.total = total
//        self.startIndex = startIndex
//        self.pageSize = pageSize
//        self.currentPage = currentPage
//        self.pages = pages
//        self.orderBy = orderBy
//        self.results = [Result]()

//    }
    
    static let example = Response( status:"ok",userTier:"user tier",total:10,startIndex:1,pageSize:10,currentPage:1,pages:29,orderBy:"relevance")
    
    
}




struct Result: Codable {

    var id: String
    var sectionId: String
    var sectionName: String
    var webPublicationDate: String
    var webTitle: String
    var webUrl: String
    var apiUrl: String
    var fields = Fields(body: "body", thumbnail: "Imagen")
    
    
    static let example = Result(id: "id",sectionId: "Section",sectionName: "Section Name",webPublicationDate:"Date",webTitle: "Web Title",webUrl: "Web URL",apiUrl: "api Url",fields: Fields(body: "body", thumbnail: "Imagen"))
    
}

struct Fields: Codable {
    var body: String
//    var headLine: String
//    var starRating: String?
//    var shortUrl: String?
    var thumbnail: String
}

struct HTMLView: UIViewRepresentable {
    let htmlString: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(htmlString, baseURL: nil)
    }
    
}




//1- Listado de noticias
//Cada ítem deberá tener:
//● Título
//● Fecha de publicación
//● Imagen
//2- Detalle del artículo:
//● Imagen
//● Fecha de publicación
//● Título
//● Cabecera
//● Cuerpo de la noticia
//(puede ser el texto plano o el formato enriquecido usando el Html)


//https://content.guardianapis.com/search?q=space&format=json&from-date=2021-
//01-01&show-tags=contributor&show-fields=starRating,headline,thumbnail,short
//-url&order-by=relevance&api-key=<API-KEY>

//https://content.guardianapis.com/science/2021/jun/01/international-space-st
//ation-robotic-arm-space-junk?show-tags=contributor&show-fields=all&api-key=
//<API-KEY>
