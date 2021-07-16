//
//  Constants.swift
//  Top Headlines
//
//  Created by Stewart Lynch on 2021-07-14.
//

import Foundation

// https://newsapi.org/v2/top-headlines?country=us&apiKey=xxxxxxxxxxxxxxxxxxxxxx
enum Constants {
    static let baseURL = "https://newsapi.org/v2/top-headlines"
    static let country = "ca"
    static let apiKey = "ced01fcf72094f08a2df9c2d1121bc57"
    static var endPoint: String {
        Self.baseURL + "?country=" + Self.country + "&apiKey=" + Self.apiKey
    }
}
