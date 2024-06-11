//
//  HomeView.swift
//  GamerPower
//
//  Created by Hussein Kishk on 05/06/2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @State private var selectedGiveaway: Giveaway? = nil

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Explore \nGames Giveaways")
                        .font(.largeTitle)
                        .bold()
                        .padding(.top, 20)
                        .padding(.leading)
                        .accessibility(identifier: "GamesGiveawaysTitle")

                    HorizontalGiveawaysView(giveaways: $viewModel.epicGamesGiveaways, selectedGiveaway: $selectedGiveaway, isLoading: $viewModel.isLoadingHorizontal)

                    HStack {
                        ForEach(Platform.allCases.filter { $0 != .epicGamesStore }, id: \.self) { platform in
                            Text(platform.rawValue)
                                .font(.system(size: 16))
                                .fontWeight(viewModel.selectedPlatform == platform ? .bold : .regular)
                                .foregroundColor(viewModel.selectedPlatform == platform ? .primary : .secondary)
                                .onTapGesture {
                                    viewModel.selectedPlatform = platform
                                }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)

                    VerticalGiveawaysView(giveaways: $viewModel.filteredGiveaways, selectedGiveaway: $selectedGiveaway, isLoading: $viewModel.isLoadingVertical)
                }
            }
            .navigationDestination(isPresented: .constant(selectedGiveaway != nil)) {
                GiveawayDetailView(giveaway: $selectedGiveaway)
            }
            .onAppear {
                viewModel.fetchGiveaways()
            }
        }
    }
}

#Preview {
    HomeView()
}
