//
//  ContentView.swift
//  Top Headlines
//
//  Created by Stewart Lynch on 2021-07-14.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = NewsViewModel()
    @State private var changeCountry = false
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    if !viewModel.isLoading {
                        HStack {
                            Text("\(viewModel.country.flag) \(viewModel.country.name)")
                                .font(.title)
                            Spacer()
                            Button {
                                changeCountry = true
                            } label: {
                                Text("Change")
                            }
                        }
                        .padding(.horizontal)
                    }
                    if #available(iOS 15, *) {
                        NewsListView(articles: viewModel.articles)
                            .task {
                                viewModel.getNews()
                            }
                    } else {
                        NewsListView(articles: viewModel.articles)
                            .onAppear {
                                viewModel.getNews()
                            }
                    }
                }
                .sheet(isPresented: $changeCountry) {
                    viewModel.articles = []
                    viewModel.getNews()
                } content: {
                    CountryListView(country: $viewModel.country)
                }

                if viewModel.isLoading {
                    ProgressView("Fetching the news")
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color(.systemBackground)))
                        .shadow(radius: 10)
                }
            }
            .navigationTitle("Top Headlines")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
