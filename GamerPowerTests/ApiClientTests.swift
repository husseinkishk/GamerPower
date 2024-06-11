//
//  ApiClientTests.swift
//  GamerPowerTests
//
//  Created by Hussein Kishk on 10/06/2024.
//

import XCTest
import Moya
import Combine
@testable import GamerPower

final class ApiClientTests: XCTestCase {
    var apiClient: ApiClient!
    var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        cancellables = []

        let endpointClosure = { (target: GamerPowerService) -> Endpoint in
            let sampleData: Data
            switch target {
            case .giveaways(let platform):
                sampleData = TestHelpers.getSampleData(for: platform)
            }
            return Endpoint(
                url: URL(target: target).absoluteString,
                sampleResponseClosure: { .networkResponse(200, sampleData) },
                method: target.method,
                task: target.task,
                httpHeaderFields: target.headers
            )
        }
        
        let provider = MoyaProvider<GamerPowerService>(
            endpointClosure: endpointClosure,
            stubClosure: MoyaProvider.immediatelyStub
        )
        
        apiClient = ApiClient(provider: provider)
    }
    
    override func tearDown() {
        apiClient = nil
        cancellables = nil
        super.tearDown()
    }
    
    func testFetchGiveaways_Success() {
        let expectation = self.expectation(description: "Fetch Giveaways")
        
        apiClient.fetchGiveaways(platform: .all)
            .sink(receiveCompletion: { completion in
                if case .failure = completion {
                    XCTFail("Expected success, got \(completion) instead")
                }
            }, receiveValue: { giveaways in
                XCTAssertEqual(giveaways.count, 3)
                XCTAssertEqual(giveaways.first?.title, "Giveaway 1")
                expectation.fulfill()
            })
            .store(in: &cancellables)
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testFetchGiveaways_Failure() {
        let provider = MoyaProvider<GamerPowerService>(endpointClosure: { (target: GamerPowerService) -> Endpoint in
            return Endpoint(
                url: URL(target: target).absoluteString,
                sampleResponseClosure: { .networkResponse(500, Data()) },
                method: target.method,
                task: target.task,
                httpHeaderFields: target.headers
            )
        }, stubClosure: MoyaProvider.immediatelyStub)
        
        apiClient = ApiClient(provider: provider)
        
        let expectation = self.expectation(description: "Fetch Giveaways")
        
        apiClient.fetchGiveaways(platform: .all)
            .sink(receiveCompletion: { completion in
                if case .failure = completion {
                    expectation.fulfill()
                } else {
                    XCTFail("Expected failure, got \(completion) instead")
                }
            }, receiveValue: { giveaways in
                XCTFail("Expected failure, got \(giveaways) instead")
            })
            .store(in: &cancellables)
        
        waitForExpectations(timeout: 1, handler: nil)
    }
}
