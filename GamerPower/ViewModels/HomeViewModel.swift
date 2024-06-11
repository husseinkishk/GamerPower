//
//  HomeViewModel.swift
//  GamerPower
//
//  Created by Hussein Kishk on 05/06/2024.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var epicGamesGiveaways: [Giveaway] = []
    @Published var filteredGiveaways: [Giveaway] = []
    @Published var selectedPlatform: Platform = .all
    @Published var isLoadingHorizontal: Bool = true
    @Published var isLoadingVertical: Bool = true
    
    private let apiClient = ApiClient()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        $selectedPlatform
            .sink { [weak self] platform in
                self?.fetchGiveawaysForSelectedPlatform(platform)
            }
            .store(in: &cancellables)
    }
    
    func fetchGiveaways() {
        isLoadingHorizontal = true
        isLoadingVertical = true
        fetchEpicGamesGiveaways()
        fetchGiveawaysForSelectedPlatform(selectedPlatform)
    }
    
    private func fetchEpicGamesGiveaways() {
        apiClient.fetchGiveaways(platform: .epicGamesStore)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] giveaways in
                self?.epicGamesGiveaways = giveaways
                self?.isLoadingHorizontal = false
            })
            .store(in: &cancellables)
    }
    
    private func fetchGiveawaysForSelectedPlatform(_ platform: Platform) {
        isLoadingVertical = true
        apiClient.fetchGiveaways(platform: platform)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] giveaways in
                self?.filteredGiveaways = giveaways
                self?.isLoadingVertical = false
            })
            .store(in: &cancellables)
    }
}
