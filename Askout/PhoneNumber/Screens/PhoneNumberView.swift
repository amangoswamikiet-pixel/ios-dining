//
//  PhoneNumberView.swift
//  Askout
//
//  Created by Aman Goswami on 29/09/26.
//

import SwiftUI

struct PhoneNumberView: View {

    @StateObject private var viewModel = PhoneNumberViewModels()

    @FocusState private var isPhoneFieldFocused: Bool
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {

            Color.white
                .ignoresSafeArea()

            VStack(spacing: 0) {

                // MARK: Navigation

                HStack {
                    Button {
                        // Back action
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 22, weight: .regular))
                            .foregroundColor(.black)
                            .frame(width: 44, height: 44)
                    }
                    .navigationBarBackButtonHidden(true)
                    Spacer()
                }
                .padding(.horizontal, 16)
                .padding(.top, 4)

                // MARK: Title

                Text("YOUR NUMBER?")
                    .font(
                        .system(
                            size: 34,
                            weight: .bold,
                            design: .default
                        )
                    )
                    .tracking(1.2)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .padding(.top, 42)
                
                
                TextField("Enter your name", text: $viewModel.name)
                    .keyboardType(.default)
                       .textContentType(.name)
                       .font(.system(size: 18))
                       .padding(.horizontal, 14)
                       .frame(height: 58)
                    
                    .background(
                        Color(
                            red: 0.96,
                            green: 0.96,
                            blue: 0.96
                        )
                    )
                    .overlay(
                         RoundedRectangle(cornerRadius: 5)
                             .stroke(
                                 viewModel.name.isEmpty
                                     ? Color.clear
                                     : Color.black,
                                 lineWidth: 1
                             )
                     )
                    .clipShape(
                        RoundedRectangle(
                            cornerRadius: 5
                        )
                    )
                    .padding(.horizontal, 62)
                    .padding(.top, 45)
                
                

                // MARK: Phone Input

                HStack(spacing: 0) {

                    // Country selector
                    Button {
                        viewModel.showCountryPicker = true
                    } label: {

                        HStack(spacing: 7) {

                            Text(viewModel.selectedCountry.flag)
                                .font(.system(size: 20))

                            Text(viewModel.selectedCountry.dialCode)
                                .font(.system(size: 17))
                                .foregroundColor(.black)

                            Image(systemName: "chevron.down")
                                .font(.system(size: 11, weight: .semibold))
                                .foregroundColor(.black)
                        }
                        .frame(width: 104, height: 58)
                    }

                    // Divider
                    Rectangle()
                        .fill(Color.gray.opacity(0.45))
                        .frame(width: 1, height: 58)

                    // Phone number
                    TextField("", text: $viewModel.phoneNumber)
                        .keyboardType(.phonePad)
                        .textContentType(.telephoneNumber)
                        .font(.system(size: 18))
                        .padding(.horizontal, 14)
                        .focused($isPhoneFieldFocused)
                        .onChange(of: viewModel.phoneNumber) { _, newValue in

                            let digits = newValue.filter { $0.isNumber }

                            if digits.count > 10 {
                                viewModel.phoneNumber = String(
                                    digits.prefix(10)
                                )
                            } else {
                                viewModel.phoneNumber = digits
                            }

                            viewModel.showValidationError = false
                        }
                }
                .frame(height: 58)
                .background(
                    Color(
                        red: 0.96,
                        green: 0.96,
                        blue: 0.96
                    )
                )
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: 5
                    )
                )
                .padding(.horizontal, 62)
                .padding(.top, 15)

                // Validation message
                if viewModel.showValidationError {

                    Text("Please enter a valid phone number")
                        .font(.system(size: 13))
                        .foregroundColor(.red)
                        .padding(.top, 8)
                }

                Spacer()

                // MARK: Continue Button

                Button {
                    isPhoneFieldFocused = false
                    viewModel.continueTapped()
                } label: {

                    Text("CONTINUE")
                        .font(
                            .system(
                                size: 23,
                                weight: .semibold
                            )
                        )
                        .tracking(0.8)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 59)
                        .background(Color.black)
                        .clipShape(
                            RoundedRectangle(
                                cornerRadius: 5
                            )
                        )
                }
                .padding(.horizontal, 75)

            }
        }
        .sheet(
            isPresented: $viewModel.showCountryPicker
        ) {
            CountryPickerView(
                selectedCountry: viewModel.selectedCountry
            ) { country in
                viewModel.selectCountry(country)
            }
            .presentationDetents([.medium, .large])
        }
    }
}

#Preview {
    PhoneNumberView()
}
