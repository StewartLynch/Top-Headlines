//
//  CountryListView.swift
//  CountryListView
//
//  Created by Stewart Lynch on 2021-07-18.
//

import SwiftUI

struct CountryListView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var country: Country
    var body: some View {
        List(Country.countries) { country in
            HStack {
                Text("\(country.flag) \(country.name)")
                Spacer()
            }.contentShape(Rectangle())
                .onTapGesture {
                    self.country = country
                    presentationMode.wrappedValue.dismiss()
                }
        }
    }
}


