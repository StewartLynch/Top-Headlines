//
//  AsyncImageList.swift
//  AsyncImageList
//
//  Created by Stewart Lynch on 2021-07-16.
//

import SwiftUI

@available(iOS 15, *)

struct AsyncImageList<Content, Placeholder>: View where Content:View, Placeholder: View {
    let url: URL?
    let content: (Image) -> Content
    let placeholder: () -> Placeholder
    @State private var currentURL: URL?
    var body: some View {
        AsyncImage(url: currentURL, content: content, placeholder: placeholder)
            .onAppear {
                if currentURL == nil {
                    DispatchQueue.main.async {
                        currentURL = url
                    }
                }
            }
    }
    
}
