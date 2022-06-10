//
//  ContentView.swift
//  NaranjaXChallenge
//
//  Created by Manuel Moyano on 06/06/2022.
//

import SwiftUI

struct ContentView: View {
    let keyplataform = "eb0274aa-bad4-4eeb-b8fe-05ac8f0c0b15"
    @State private var response = EndpointResponse(response: Response.example)
    let viewTitle = "Noticias"
    @State private var page = 1
    
    var body: some View {
        NavigationView {
            List (response.response.results, id: \.id) {item in
                VStack {
                    NavigationLink {
                        NewsView(result: item)
                    } label: {
                        VStack (alignment: .center){
                            AsyncImage(url: URL(string: "\(item.fields.thumbnail)")) { image in
                                image.resizable()
                            } placeholder: {
                                Color.gray
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .scaledToFill()
                            VStack {
                                Text(item.webTitle)
                                    .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                                .lineLimit(6)
                                .font(.title2)
                                Text (item.webPublicationDate)
                                        .font(.headline)
                                        .multilineTextAlignment(.leading)
                                
                            }
                        }
                    }

                }
            }

            .task {
                 await loadData()
             }
            .navigationTitle(viewTitle)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        Button {
                            if page > 1 {
                                page -= 1
                                Task {
                                await loadData()
                                }
                            }
                        } label: {
                            Image(systemName: "minus")
                        }
                        Text ("\(page)")
                        Button {
                            if page < response.response.pages {
                                page += 1
                                Task {
                                await loadData()
                            }
                            }
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
        }
    }
    
    func loadData() async {
    //    Creating the URL we want to read.
    //    Fetching the data for that URL.
    //    Decoding the result of that data into a struct.
        guard let url = URL(string: "https://content.guardianapis.com/search?page=\(page)&q=format=json&from-date=2022-01-01&show-fields=body,headline,thumbnail,short-url&order-by=relevance&api-key=\(keyplataform)") else {
            print("Invalid URL")
            return
        }
        do {
    //      El guion bajo en data descarta los metadatos y se queda solo con los datos de la URL
            let (data, _) = try await URLSession.shared.data(from: url)
            print("Se ingreso a la funcion")
            if let decodedResponse = try? JSONDecoder().decode(EndpointResponse.self, from: data) {
                response = decodedResponse
            }
            
        } catch {
            print("Invalid data")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

