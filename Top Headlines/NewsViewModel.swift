//
//  NewsViewModel.swift
//  Top Headlines
//
//  Created by Stewart Lynch on 2021-07-14.
//

import Foundation

class NewsViewModel: ObservableObject {
    @Published var articles: [ArticleViewModel] = []
    @Published var country = Country.country(code: Constants.country)
    @Published var isLoading = false
    @Published var totalResults = 0
    @Published var currentPage = 1
    
    var numPages: Int {
        (Double(totalResults / 20) == Double(totalResults) / 20.0) ? (totalResults / 20) : (totalResults / 20) + 1
    }
    
    var countryEndpoint: String {
        Constants.baseURL + "?country=" + country.code + "&page=" + String(currentPage) + "&apiKey=" + Constants.apiKey
    }
    
    func incrementPage() {
        currentPage = (currentPage == numPages) ? 1 : currentPage + 1
    }
    func getNews() {
        isLoading = true
        if #available(iOS 15, *) {
            Task.init {
                do {
                let news:News = try await APIService.shared.getJSON(urlString: countryEndpoint, dateDecodingStrategy: .iso8601)
                    articles = news.articles.map(ArticleViewModel.init)
                    totalResults = news.totalResults
                    isLoading = false
                } catch {
                    print(error.localizedDescription)
                    isLoading = false
                }
            }

        } else {
            APIService.shared.getJSON(urlString: countryEndpoint, dateDecodingStrategy: .iso8601) { (result: Result<News, APIService.APIError>) in
                switch result {
                case .success(let news):
                    DispatchQueue.main.async {
                        self.articles = news.articles.map(ArticleViewModel.init)
                        self.isLoading = false
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    self.isLoading = false
                }
            }
        }
    }
}
