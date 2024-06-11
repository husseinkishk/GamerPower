//
//  HomeViewModelTests.swift
//  GamerPowerTests
//
//  Created by Hussein Kishk on 10/06/2024.
//

import XCTest
import Combine
@testable import GamerPower


final class HomeViewModelTests: XCTestCase {
    var viewModel: HomeViewModel!
    var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        viewModel = HomeViewModel()
        cancellables = []
    }
    
    override func tearDown() {
        viewModel = nil
        cancellables = nil
        super.tearDown()
    }
    
    func testFetchEpicGamesGiveaways() {
        let expectation = self.expectation(description: "Fetch Epic Games Giveaways")
        
        viewModel.$epicGamesGiveaways
            .dropFirst()
            .sink(receiveValue: { giveaways in
                XCTAssertFalse(giveaways.isEmpty)
                expectation.fulfill()
            })
            .store(in: &cancellables)
        
        viewModel.fetchGiveaways()
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testFetchGiveawaysForSelectedPlatform() {
        let expectation = self.expectation(description: "Fetch Giveaways For Selected Platform")
        
        viewModel.$filteredGiveaways
            .dropFirst()
            .sink(receiveValue: { giveaways in
                XCTAssertFalse(giveaways.isEmpty)
                expectation.fulfill()
            })
            .store(in: &cancellables)
        
        viewModel.selectedPlatform = .steam
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}
