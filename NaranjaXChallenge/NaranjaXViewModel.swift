//
//  NaranjaXViewModel.swift
//  NaranjaXChallenge
//
//  Created by Manuel Moyano on 11/06/2022.
//

import Foundation

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        let keyplataform = "eb0274aa-bad4-4eeb-b8fe-05ac8f0c0b15"
        @Published var response = EndpointResponse(response: Response.example)
        let viewTitle = "Noticias"
        @Published var page = 1
        
        func loadData() async {
            guard let url = URL(string: "https://content.guardianapis.com/search?page=\(page)&q=format=json&from-date=2022-01-01&show-fields=body,headline,thumbnail,short-url&order-by=relevance&api-key=\(keyplataform)") else {
                print("Invalid URL")
                return
            }
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                print("Se ingreso a la funcion")
                if let decodedResponse = try? JSONDecoder().decode(EndpointResponse.self, from: data) {
                    response = decodedResponse
                }
                
            } catch {
                print("Invalid data")
            }
        }
        
        func minPage() {
            if page > 1 {
                page -= 1
                Task {
                    await loadData()
                }
            }
        }
        
        func maxPage() {
            if page < response.response.pages {
                page += 1
                Task {
                await loadData()
            }
            }
        }
        
        
        
        
    }
}


