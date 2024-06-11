//
//  VerticalGiveawaysView.swift
//  GamerPower
//
//  Created by Hussein Kishk on 11/06/2024.
//

import SwiftUI

struct VerticalGiveawaysView: View {
    @Binding var giveaways: [Giveaway]
    @Binding var selectedGiveaway: Giveaway?
    @Binding var isLoading: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            if isLoading {
                ProgressView("Loading...")
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding(.top, 24)
                    .frame(maxWidth: .infinity)
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(10)
                    .padding(.horizontal)
            } else {
                ScrollView {
                    VStack {
                        ForEach($giveaways) { $giveaway in
                            GiveawayCard(giveaway: $giveaway, showPlatforms: true)
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .frame(height: 300)
                                .redacted(reason: isLoading ? .placeholder : [])
                                .onTapGesture {
                                    selectedGiveaway = giveaway
                                }
                        }
                    }
                    .padding(.horizontal)
                }
                .accessibility(identifier: "AllGiveawaysScrollView")
            }
        }
    }
}
