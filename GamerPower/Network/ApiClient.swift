//
//  ApiClient.swift
//  GamerPower
//
//  Created by Hussein Kishk on 05/06/2024.
//

import Foundation
import Combine
import Moya

//protocol GamerPowerServiceProvider {
//    func request(_ target: GamerPowerService, completion: @escaping Moya.Completion) -> Moya.Cancellable
//}
//
//extension MoyaProvider: GamerPowerServiceProvider where Target == GamerPowerService {}

protocol ApiClientProtocol {
    func fetchGiveaways(platform: Platform) -> AnyPublisher<[Giveaway], ApiError>
}

class ApiClient: ApiClientProtocol {
    private let provider: MoyaProvider<GamerPowerService>
    
    init(provider: MoyaProvider<GamerPowerService> = MoyaProvider<GamerPowerService>()) {
        self.provider = provider
    }

    func fetchGiveaways(platform: Platform) -> AnyPublisher<[Giveaway], ApiError> {
        return Future<[Giveaway], ApiError> { promise in
            self.provider.request(.giveaways(platform: platform)) { result in
                switch result {
                case let .success(response):
                    do {
                        let giveaways = try JSONDecoder().decode([Giveaway].self, from: response.data)
                        promise(.success(giveaways))
                    } catch {
                        debugPrint(error)
                        promise(.failure(.networkError))
                    }
                case .failure:
                    promise(.failure(.networkError))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}

enum ApiError: Error, Equatable {
    case networkError
}
