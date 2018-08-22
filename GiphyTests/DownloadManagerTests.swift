//
//  DownloadManagerTests.swift
//  GiphyTests
//
//  Created by Viktar Semianchuk on 8/22/18.
//  Copyright © 2018 Viktar Semianchuk. All rights reserved.
//

import XCTest
@testable import Giphy

class DownloadManagerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_downloadManager_success() {
        let url: String = "https://api.giphy.com/v1/gifs/feqkVgjJpYtjy?api_key=dc6zaTOxFJmzC"
        let downloadManager = DownloadManager()
        var fetchedData: Data?
        let expectation = self.expectation(description: "test_downloadManager_success")
        downloadManager.fetchData(fromURL: url) { (data) in
            fetchedData = data
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
        XCTAssertNotNil(fetchedData, "Data by valid url can't be nil")
    }
    
    func test_downloadManager_failure() {
        let url: String = ""
        let downloadManager = DownloadManager()
        var fetchedData: Data?
        let expectation = self.expectation(description: "test_downloadManager_failure")
        downloadManager.fetchData(fromURL: url) { (data) in
            fetchedData = data
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1, handler: nil)
        XCTAssertNil(fetchedData, "Data for invalid url should be nil")
    }
    
}
