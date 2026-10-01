//
//  CountryPickerView.swift
//  Askout
//
//  Created by Aman Goswami on 01/10/26.
//

import Foundation
import SwiftUI

struct CountryPickerView: View {

    let selectedCountry: Country
    let onSelect: (Country) -> Void

    @Environment(\.dismiss) private var dismiss

    var body: some View {

        NavigationStack {

            List(Country.availableCountries) { country in

                Button {
                    onSelect(country)
                    dismiss()
                } label: {

                    HStack(spacing: 14) {

                        Text(country.flag)
                            .font(.system(size: 25))

                        Text(country.name)
                            .foregroundColor(.primary)

                        Spacer()

                        Text(country.dialCode)
                            .foregroundColor(.secondary)

                        if country == selectedCountry {

                            Image(systemName: "checkmark")
                                .foregroundColor(.blue)
                        }
                    }
                }
            }
            .navigationTitle("Select Country")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
