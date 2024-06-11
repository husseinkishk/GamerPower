//
//  GiveawayCardTests.swift
//  GamerPowerTests
//
//  Created by Hussein Kishk on 10/06/2024.
//

import XCTest
import SwiftUI
import ViewInspector
@testable import GamerPower

final class GiveawayCardTests: XCTestCase {
    var giveaway: Giveaway!
    var view: GiveawayCard!
    
    override func setUp() {
        super.setUp()
        giveaway = Giveaway(id: 1, title: "Giveaway 1", worth: nil, thumbnail: "", image: "", description: "Description 1", instructions: "", open_giveaway_url: "", published_date: "", type: "", platforms: "", end_date: nil, users: 123, isLiked: false)
        view = GiveawayCard(giveaway: .constant(giveaway), showPlatforms: true)
    }
    
    override func tearDown() {
        giveaway = nil
        view = nil
        super.tearDown()
    }
    
    func testGiveawayTitle() throws {
        let text = try view.inspect().find(text: "Giveaway 1")
        XCTAssertEqual(try text.string(), "Giveaway 1")
    }
}
