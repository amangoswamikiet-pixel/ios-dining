//
//  PhoneNumberViewModels.swift
//  Askout
//
//  Created by Aman Goswami on 01/10/26.
//

import Foundation
import SwiftUI
import Combine

@MainActor
final class PhoneNumberViewModels: ObservableObject {
    
    @Published var name: String = ""
    @Published var phoneNumber: String = ""
    @Published var selectedCountry = Country.india
    @Published var showCountryPicker = false
    @Published var showValidationError = false

    var isPhoneNumberValid: Bool {
           let digits = phoneNumber.filter { $0.isNumber }
           return digits.count == 10
       }

       var formattedPhoneNumber: String {
           phoneNumber.filter { $0.isNumber }
       }

       func continueTapped() {
           guard isPhoneNumberValid else {
               showValidationError = true
               return
           }

           showValidationError = false

           // API / authentication request can be made here.
           print("Phone: \(selectedCountry.dialCode)\(formattedPhoneNumber)")
       }

       func selectCountry(_ country: Country) {
           selectedCountry = country
           showCountryPicker = false
       }
}
