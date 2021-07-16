//
//  ContentView.swift
//  Top Headlines
//
//  Created by Stewart Lynch on 2021-07-14.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = NewsViewModel()
    var body: some View {
        NavigationView {
            ZStack {
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
