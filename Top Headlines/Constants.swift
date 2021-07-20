//
//  Constants.swift
//  Top Headlines
//
//  Created by Stewart Lynch on 2021-07-14.
//

import Foundation

// https://newsapi.org/v2/top-headlines?country=us&apiKey=xxxxxxxxxxxxxxxxxxxxxx
#warning("Make sure you add your key")
enum Constants {
    static let baseURL = "https://newsapi.org/v2/top-headlines"
    static let country = "ca"
    static let apiKey = "REPLACE THIS WITH YOUR KEY"
    static var endPoint: String {
        Self.baseURL + "?country=" + Self.country + "&apiKey=" + Self.apiKey
    }
}
