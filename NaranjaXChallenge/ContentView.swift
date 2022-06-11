//
//  ContentView.swift
//  NaranjaXChallenge
//
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            List (viewModel.response.response.results, id: \.id) {item in
                VStack {
                    NavigationLink {
                        NewsView(result: item)
                    } label: {
                        VStack (alignment: .center){
                            ImageView(stringURL: item.fields.thumbnail)
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
                await viewModel.loadData()
             }
            .navigationTitle(viewModel.viewTitle)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        Button {
                            viewModel.minPage()
                        } label: {
                            Image(systemName: "minus")
                        }
                        Text ("\(viewModel.page)")
                        Text ("/")
                        Text ("\(viewModel.response.response.pages)")
                        Button {
                            viewModel.maxPage()
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

