//
//  String+Extension.swift
//  Top Headlines
//
//  Created by Stewart Lynch on 2021-07-15.
//

import Foundation

extension String {
    var withoutHtmlTags: String {
    return self.replacingOccurrences(of: "<[^>]+>", with: "", options:
    .regularExpression, range: nil).replacingOccurrences(of: "&[^;]+;", with:
    "", options:.regularExpression, range: nil)
    }
}
