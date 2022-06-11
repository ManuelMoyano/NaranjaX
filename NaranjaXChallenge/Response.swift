//
//  Response.swift
//  NaranjaXChallenge
//
//

import Foundation
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
    var fields = Fields(headline: "HeadLine", body: "Body", thumbnail: "Imagen")
    
    
    static let example = Result(id: "id",sectionId: "Section",sectionName: "Section Name",webPublicationDate:"Date",webTitle: "Web Title",webUrl: "Web URL",apiUrl: "api Url",fields: Fields(headline: "Headline", body: "Body", thumbnail: "Imagen"))
    
}

struct Fields: Codable {
    var headline: String
    var body: String
//    var starRating: String?
//    var shortUrl: String?
    var thumbnail: String
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
