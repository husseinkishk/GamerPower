//
//  TestHelpers.swift
//  GamerPowerTests
//
//  Created by Hussein Kishk on 10/06/2024.
//

import Foundation
@testable import GamerPower

enum TestHelpers {
    static func getSampleData(for platform: Platform) -> Data {
        let jsonString = """
        [
            {
                "id": 1,
                "title": "Giveaway 1",
                "worth": null,
                "thumbnail": "",
                "image": "",
                "description": "Description 1",
                "instructions": "",
                "open_giveaway_url": "",
                "published_date": "",
                "type": "",
                "platforms": "",
                "end_date": null
            },
            {
                "id": 2,
                "title": "Giveaway 2",
                "worth": null,
                "thumbnail": "",
                "image": "",
                "description": "Description 2",
                "instructions": "",
                "open_giveaway_url": "",
                "published_date": "",
                "type": "",
                "platforms": "",
                "end_date": null
            },
            {
                "id": 3,
                "title": "Giveaway 3",
                "worth": null,
                "thumbnail": "",
                "image": "",
                "description": "Description 3",
                "instructions": "",
                "open_giveaway_url": "",
                "published_date": "",
                "type": "",
                "platforms": "",
                "end_date": null
            }
        ]
        """
        return jsonString.data(using: .utf8)!
    }
}
