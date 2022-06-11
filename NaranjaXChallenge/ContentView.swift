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
                await viewModel.loadData()
             }
            .navigationTitle(viewModel.viewTitle)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        Button {
                            if viewModel.page > 1 {
                                viewModel.page -= 1
                                Task {
                                await viewModel.loadData()
                                }
                            }
                        } label: {
                            Image(systemName: "minus")
                        }
                        Text ("\(viewModel.page)")
                        Button {
                            if viewModel.page < viewModel.response.response.pages {
                                viewModel.page += 1
                                Task {
                                await viewModel.loadData()
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

