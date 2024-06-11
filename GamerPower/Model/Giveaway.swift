//
//  Giveaway.swift
//  GamerPower
//
//  Created by Hussein Kishk on 05/06/2024.
//

import Foundation

struct Giveaway: Codable, Identifiable, Equatable {
    let id: Int
    let title: String
    let worth: String?
    let thumbnail: String
    let image: String
    let description: String
    let instructions: String
    let open_giveaway_url: String
    let published_date: String
    let type: String
    let platforms: String
    let end_date: String?
    let users: Int?
    var isLiked: Bool?

    var endDateFormatted: String? {
        return end_date?.formattedDate()
    }
    
    var liked: Bool {
        get {
            return isLiked ?? false
        }
        set {
            isLiked = newValue
        }
    }
}
