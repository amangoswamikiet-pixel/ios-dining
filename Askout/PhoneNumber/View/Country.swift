//
//  Country.swift
//  Askout
//
//  Created by Aman Goswami on 01/10/26.
//

import Foundation


struct Country: Identifiable, Equatable {

    let id = UUID()
    let name: String
    let flag: String
    let dialCode: String

    static let india = Country(
        name: "India",
        flag: "🇮🇳",
        dialCode: "+91"
    )

    static let availableCountries: [Country] = [
        Country(name: "India", flag: "🇮🇳", dialCode: "+91"),
        Country(name: "United States", flag: "🇺🇸", dialCode: "+1"),
        Country(name: "United Kingdom", flag: "🇬🇧", dialCode: "+44"),
        Country(name: "Australia", flag: "🇦🇺", dialCode: "+61"),
        Country(name: "Canada", flag: "🇨🇦", dialCode: "+1"),
        Country(name: "Singapore", flag: "🇸🇬", dialCode: "+65"),
        Country(name: "United Arab Emirates", flag: "🇦🇪", dialCode: "+971")
    ]
}
