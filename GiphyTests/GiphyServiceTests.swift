//
//  GiphyServiceTests.swift
//  GiphyTests
//
//  Created by Viktar Semianchuk on 8/22/18.
//  Copyright © 2018 Viktar Semianchuk. All rights reserved.
//

import XCTest
@testable import Giphy

class GiphyServiceTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_fetchingTrendingsFromUrl_success() {
        let giphyService = GiphyService()
        let mockUrl = "https://api.giphy.com/v1/gifs/trending?api_key=dc6zaTOxFJmzC"
        let expectation = self.expectation(description: "test_fetchingTrendingsFromUrl_success")
        var fetchedResults: [GiphyData]?
        giphyService.fetchTrendingsFromUrl(mockUrl) { (results, _) in
            fetchedResults = results
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
        XCTAssertNotNil(fetchedResults, "Results can't be nil for legal url")
    }
    
    func test_fetchingTrendingsFromUrl_failure() {
        let giphyService = GiphyService()
        let mockUrl = ""
        let expectation = self.expectation(description: "test_fetchingTrendingsFromUrl_failure")
        var resultError: Error?
        giphyService.fetchTrendingsFromUrl(mockUrl) { (_, error) in
            resultError = error
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1, handler: nil)
        XCTAssertNotNil(resultError, "Error can't be nil for illegal url")
    }
    
}
