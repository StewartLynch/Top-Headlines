//
//  Country.swift
//  Country
//
//  Created by Stewart Lynch on 2021-07-16.
//

import Foundation

struct Country: Identifiable {
        var id: UUID {
            UUID()
        }
        let name: String
        let code: String
        let flag: String
    
    static func country(code: String) -> Country {
        Self.countries.first { $0.code.lowercased() == code.lowercased()}!
    }
    
    static var countries:[Country] {
        [
            Country(name:"Anguilla", code:"AI", flag:"🇦🇮"),
            Country(name:"Australia", code:"AU", flag:"🇦🇺"),
            Country(name:"Austria", code:"AT", flag:"🇦🇹"),
            Country(name:"Belgium", code:"BE", flag:"🇧🇪"),
            Country(name:"Brazil", code:"BR", flag:"🇧🇷"),
            Country(name:"Bulgaria", code:"BG", flag:"🇧🇬"),
            Country(name:"Canada", code:"CA", flag:"🇨🇦"),
            Country(name:"China", code:"CN", flag:"🇨🇳"),
            Country(name:"Columbia", code:"CO", flag:"🇨🇴"),
            Country(name:"Cuba", code:"CU", flag:"🇨🇺"),
            Country(name:"Czech Republic", code:"CZ", flag:"🇨🇿"),
            Country(name:"Egypt", code:"EG", flag:"🇪🇬"),
            Country(name:"France", code:"FR", flag:"🇫🇷"),
            Country(name:"Germany", code:"DE", flag:"🇩🇪"),
            Country(name:"Greece", code:"GR", flag:"🇬🇷"),
            Country(name:"Hong Kong", code:"HK", flag:"🇭🇰"),
            Country(name:"Hungary", code:"HU", flag:"🇭🇺"),
            Country(name:"India", code:"IN", flag:"🇮🇳"),
            Country(name:"Indonesia", code:"ID", flag:"🇮🇩"),
            Country(name:"Ireland", code:"IE", flag:"🇮🇪"),
            Country(name:"Israel", code:"IL", flag:"🇮🇱"),
            Country(name:"Italy", code:"IT", flag:"🇮🇹"),
            Country(name:"Japan", code:"JP", flag:"🇯🇵"),
            Country(name:"Latvia", code:"LV", flag:"🇱🇻"),
            Country(name:"Lithuania", code:"LT", flag:"🇱🇹"),
            Country(name:"Malaysia", code:"MY", flag:"🇲🇾"),
            Country(name:"Mexico", code:"MX", flag:"🇲🇽"),
            Country(name:"Morocco", code:"MA", flag:"🇲🇦"),
            Country(name:"Netherlands", code:"NL", flag:"🇳🇱"),
            Country(name:"New Zealand", code:"NZ", flag:"🇳🇿"),
            Country(name:"Nigeria", code:"NG", flag:"🇳🇬"),
            Country(name:"Norway", code:"NO", flag:"🇳🇴"),
            Country(name:"Philippines", code:"PH", flag:"🇵🇭"),
            Country(name:"Poland", code:"PL", flag:"🇵🇱"),
            Country(name:"Portugal", code:"PT", flag:"🇵🇹"),
            Country(name:"Romania", code:"RO", flag:"🇷🇴"),
            Country(name:"Russia", code:"RU", flag:"🇷🇺"),
            Country(name:"Saudi Arabia", code:"SA", flag:"🇸🇦"),
            Country(name:"Serbia", code:"RS", flag:"🇷🇸"),
            Country(name:"Singapore", code:"SG", flag:"🇸🇬"),
            Country(name:"Slovakia", code:"SK", flag:"🇸🇰"),
            Country(name:"Slovenia", code:"SI", flag:"🇸🇮"),
            Country(name:"South Africa", code:"ZA", flag:"🇿🇦"),
            Country(name:"South Korea", code:"KR", flag:"🇰🇷"),
            Country(name:"Sweden", code:"SE", flag:"🇸🇪"),
            Country(name:"Switzerland", code:"CH", flag:"🇨🇭"),
            Country(name:"Taiwan", code:"TW", flag:"🇹🇼"),
            Country(name:"Thailand", code:"TH", flag:"🇹🇭"),
            Country(name:"Turkey", code:"TR", flag:"🇹🇷"),
            Country(name:"Ukraine", code:"UA", flag:"🇺🇦"),
            Country(name:"United Arab Emirates", code:"AE", flag:"🇦🇪"),
            Country(name:"United Kingdom", code:"GB", flag:"🇬🇧"),
            Country(name:"United States", code:"US", flag:"🇺🇸"),
            Country(name:"Venezuela", code:"VE", flag:"🇻🇨")
        ]
    }
}
