//
//  GiveawayCard.swift
//  GamerPower
//
//  Created by Hussein Kishk on 05/06/2024.
//

import SwiftUI

import SwiftUI

struct GiveawayCard: View {
    @Binding var giveaway: Giveaway
    let showPlatforms: Bool

    var body: some View {
        ZStack(alignment: .topTrailing) {
            ZStack(alignment: .topLeading) {
                if let url = URL(string: giveaway.image) {
                    AsyncImage(url: url)
                        .clipped()
                        .cornerRadius(10)
                        .overlay(
                            Rectangle()
                                .fill(Color.black.opacity(0.6))
                                .cornerRadius(10)
                        )
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text(giveaway.title)
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                            .padding([.top, .horizontal])
                        
                        Spacer()
                        
                        Button(action: {
                            giveaway.liked.toggle()
                        }) {
                            Image(systemName: giveaway.liked ? "heart.fill" : "heart")
                                .font(.system(size: 24))
                            
                                .foregroundColor(.white)
                                .padding()
                        }
                    }
                    
                    if showPlatforms {
                        Text(giveaway.platforms)
                            .font(.system(size: 14))
                            .foregroundColor(.white.opacity(0.8))
                            .padding(.horizontal)
                    }
                    
                    Spacer()
                    
                    Text(giveaway.description)
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                        .padding([.horizontal, .bottom])
                        .lineLimit(4)
                }
                .cornerRadius(10)
            }
            .background(Color(.systemBackground))
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
        }
    }
}
