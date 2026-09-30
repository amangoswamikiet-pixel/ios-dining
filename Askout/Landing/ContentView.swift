//
//  ContentView.swift
//  Askout
//
//  Created by Aman Goswami on 28/09/26.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                
                // MARK: - Background Image
                Image("restaurantBackground")
                    .resizable()
                    .scaledToFill()
                    .frame(
                        width: geometry.size.width,
                        height: geometry.size.height
                    )
                    .clipped()
                    .ignoresSafeArea()
                
                // MARK: - Dark Overlay
                LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: Color.black.opacity(0.35), location: 0.0),
                        .init(color: Color.black.opacity(0.05), location: 0.35),
                        .init(color: Color.black.opacity(0.15), location: 0.65),
                        .init(color: Color.black.opacity(0.65), location: 1.0)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                
                // MARK: - Main Content
                VStack {
                    
                    // Top Logo
                    VStack(spacing: 8) {
                        
                        Image("AskOut")
                            .resizable()
                            .scaledToFit()
                         .frame(width: 230)
                        
                        Text("An Evening to Remember.")
                            .font(
                                .system(
                                    size: 19,
                                    weight: .regular,
                                    design: .default
                                )
                            )
                    }
                    .foregroundColor(.white)
                    .padding(.top, 55)
                    
                    Spacer()
                    
                    // MARK: - Bottom Section
                    VStack(spacing: 24) {
                        
                        // Phone Number Button
                        NavigationLink {
                           PhoneNumberView()
                        } label: {
                            Text("PHONE NUMBER")
                                .font(
                                    .system(
                                        size: 21,
                                        weight: .bold,
                                        design: .default
                                    )
                                )
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity)
                                .frame(height: 59)
                                .background(
                                    RoundedRectangle(
                                        cornerRadius: 6
                                    )
                                    .fill(Color.white)
                                )
                        }
                        .padding(.horizontal, 71)
                        
                        
                        // Privacy Text
                        Text("""
                        Book & Dine makes it easy to discover, book & enjoy your perfect dining experience.
                        """)
                        .font(
                            .system(
                                size: 14,
                                weight: .regular,
                                design: .default
                            )
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .lineSpacing(2)
                        .padding(.horizontal, 35)
                    }
                    .padding(.bottom, 45)
                }
            }
        }
    }
}


#Preview {
    ContentView()
}

#Preview {
    ContentView()
}
