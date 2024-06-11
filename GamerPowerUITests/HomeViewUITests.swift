//
//  HomeViewUITests.swift
//  GamerPowerUITests
//
//  Created by Hussein Kishk on 10/06/2024.
//

import XCTest

import XCTest

class HomeViewUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGamesGiveawaysTitle() {
        let title = app.staticTexts["GamesGiveawaysTitle"]
        XCTAssertTrue(title.exists)
    }
    
    func testHorizontalGiveawaysSection() {
        // Ensure the Explore title exists
        let exploreTitle = app.staticTexts["GamesGiveawaysTitle"]
        XCTAssertTrue(exploreTitle.waitForExistence(timeout: 10))
        
        // Ensure the horizontal section exists
        let epicGamesScrollView = app.scrollViews["EpicGamesScrollView"]
        XCTAssertTrue(epicGamesScrollView.waitForExistence(timeout: 10))
        
        // Check that at least one card exists in the horizontal section
        let firstCard = epicGamesScrollView.children(matching: .other).element(boundBy: 0)
        XCTAssertTrue(firstCard.waitForExistence(timeout: 10))
        
        // Swipe left and right to verify scrolling
        epicGamesScrollView.swipeLeft()
        epicGamesScrollView.swipeRight()
    }
    
    func testVerticalGiveawaysSection() {
        // Ensure the Explore title exists
        let exploreTitle = app.staticTexts["GamesGiveawaysTitle"]
        XCTAssertTrue(exploreTitle.waitForExistence(timeout: 10))
        
        // Ensure the vertical section exists
        let allGiveawaysScrollView = app.scrollViews["AllGiveawaysScrollView"]
        XCTAssertTrue(allGiveawaysScrollView.waitForExistence(timeout: 10))
        
        // Check that at least one card exists in the vertical section
        let firstCard = allGiveawaysScrollView.children(matching: .other).element(boundBy: 0)
        XCTAssertTrue(firstCard.waitForExistence(timeout: 10))
        
        // Swipe up and down to verify scrolling
        allGiveawaysScrollView.swipeUp()
        allGiveawaysScrollView.swipeDown()
    }

    func testFilterBar() {
        let allFilterButton = app.staticTexts["all"]
        XCTAssertTrue(allFilterButton.waitForExistence(timeout: 10))
        allFilterButton.tap()

        let steamFilterButton = app.staticTexts["steam"]
        XCTAssertTrue(steamFilterButton.waitForExistence(timeout: 10))
        steamFilterButton.tap()
    }
    
    func testNavigationToDetails() {
        // Ensure the vertical section exists
        let allGiveawaysScrollView = app.scrollViews["AllGiveawaysScrollView"]
        XCTAssertTrue(allGiveawaysScrollView.waitForExistence(timeout: 10))
        
        // Tap the first card to navigate to the details view
        let firstCard = allGiveawaysScrollView.children(matching: .other).element(boundBy: 0)
        XCTAssertTrue(firstCard.exists)
        firstCard.tap()
        
        // Verify that the details view appears
        let detailsTitle = app.staticTexts["GiveawayDetailTitle"]
        XCTAssertTrue(detailsTitle.waitForExistence(timeout: 10))
        
        // Go back to the main view
        let backButton = app.buttons["GiveawayDetailBackButton"]
        XCTAssertTrue(backButton.exists)
        backButton.tap()
    }

}
