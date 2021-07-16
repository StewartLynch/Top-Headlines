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
                List(viewModel.articles) { article in
                    VStack(alignment: .leading) {
                        Group {
                            Text(article.source).fontWeight(.bold)
                            Text(article.author)
                            Text(article.date)
                        }
                        .font(.caption)
                        Text(article.title).fontWeight(.bold)
                        Text(article.description)
                            .foregroundColor(Color.secondary)
                        HStack {
                            Spacer()
                            Link(destination: article.url, label: {
                                Image(systemName: "globe")
                                    .font(.system(size: 36))
                                    .foregroundColor(.gray)
                                    .overlay(
                                        Image(systemName: "link")
                                            .font(.system(size: 12, weight: .bold))
                                            .foregroundColor(.gray)
                                            .padding(1)
                                            .background(Circle()
                                                            .fill(Color(.secondarySystemBackground))
                                                            .shadow(color: .black.opacity(0.4), radius: 2, x: 0, y: 2)
                                            )
                                            .shadow(color: .black.opacity(0.4), radius: 2, x: 0, y: 2)
                                    )
                            })
                            .buttonStyle(PlainButtonStyle())
                        }
                        if let image = article.image {
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                }
                .onAppear {
                    viewModel.getNews()
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
