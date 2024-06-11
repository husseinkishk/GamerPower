//
//  HorizontalGiveawaysView.swift
//  GamerPower
//
//  Created by Hussein Kishk on 11/06/2024.
//

import SwiftUI

struct HorizontalGiveawaysView: View {
    @Binding var giveaways: [Giveaway]
    @Binding var selectedGiveaway: Giveaway?
    @Binding var isLoading: Bool

    var body: some View {
        VStack(alignment: .leading) {
            if isLoading {
                ProgressView("Loading...")
                    .progressViewStyle(CircularProgressViewStyle())
                    .frame(height: 220)
                    .frame(maxWidth: .infinity)
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(10)
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach($giveaways) { $giveaway in
                            GeometryReader { geometry in
                                GiveawayCard(giveaway: $giveaway, showPlatforms: false)
                                    .rotation3DEffect(
                                        Angle(degrees: (Double(geometry.frame(in: .global).minX) - 30) / -20),
                                        axis: (x: 0.0, y: 10.0, z: 0.0)
                                    )
                                    .redacted(reason: isLoading ? .placeholder : [])
                            }
                            .frame(width: 300, height: 200)
                            .onTapGesture {
                                selectedGiveaway = giveaway
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                }
                .accessibility(identifier: "EpicGamesScrollView")
                .frame(height: 220)
            }
        }
    }
}
