//
//  GamerPowerService.swift
//  GamerPower
//
//  Created by Hussein Kishk on 05/06/2024.
//

import Foundation
import Moya


enum GamerPowerService {
    case giveaways(platform: Platform)
}

extension GamerPowerService: TargetType {
    var baseURL: URL { URL(string: "https://www.gamerpower.com/api")! }
    
    var path: String {
        return "/giveaways"
    }
    
    var task: Task {
        switch self {
        case .giveaways(let platform):
            let parameters: [String: String]
            if platform == .all {
                parameters = [:]
            } else {
                parameters = ["platform": platform.rawValue]
            }
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        }
    }
    
    var method: Moya.Method { .get }
    var sampleData: Data { Data() }

    var headers: [String: String]? { nil }
}
