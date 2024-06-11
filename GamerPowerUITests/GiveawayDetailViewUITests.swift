//
//  GiveawayDetailViewUITests.swift
//  GamerPowerUITests
//
//  Created by Hussein Kishk on 10/06/2024.
//

import XCTest

class GiveawayDetailViewUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGiveawayDetailTitle() {
        let firstGiveaway = app.scrollViews["AllGiveawaysScrollView"].children(matching: .other).element(boundBy: 0)
        let exists = NSPredicate(format: "exists == true")
        
        expectation(for: exists, evaluatedWith: firstGiveaway, handler: nil)
        waitForExpectations(timeout: 10, handler: nil)
        
        firstGiveaway.tap()
        
        let title = app.staticTexts["GiveawayDetailTitle"]
        expectation(for: exists, evaluatedWith: title, handler: nil)
        waitForExpectations(timeout: 10, handler: nil)
        
        XCTAssertTrue(title.exists)
    }
    
    func testGiveawayDetailView() {
        // Navigate to GiveawayDetailView
        let exploreTitle = app.staticTexts["GamesGiveawaysTitle"]
        XCTAssertTrue(exploreTitle.waitForExistence(timeout: 10))
        
        let firstGiveaway = app.scrollViews["AllGiveawaysScrollView"].children(matching: .other).element(boundBy: 0)
        XCTAssertTrue(firstGiveaway.waitForExistence(timeout: 10))
        firstGiveaway.tap()
        
        // Verify that the GiveawayDetailView appears
        let detailTitle = app.staticTexts["GiveawayDetailTitle"]
        XCTAssertTrue(detailTitle.waitForExistence(timeout: 10))

        // Verify the "Get it" button
        let getItButton = app.buttons["GiveawayDetailGetItButton"]
        XCTAssertTrue(getItButton.exists)
        
        // Verify the like button
        let likeButton = app.buttons["GiveawayDetailLikeButton"]
        XCTAssertTrue(likeButton.exists)

        // Verify the back button
        let backButton = app.buttons["GiveawayDetailBackButton"]
        XCTAssertTrue(backButton.exists)
        backButton.tap()
        
        // Verify that we navigated back to the main view
        XCTAssertTrue(exploreTitle.exists)
    }
}
