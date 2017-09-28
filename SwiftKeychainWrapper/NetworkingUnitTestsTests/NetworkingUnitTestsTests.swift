//
//  NetworkingUnitTestsTests.swift
//  NetworkingUnitTestsTests
//
//  Created by Mac on 9/20/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import XCTest
@testable import NetworkingUnitTests

class NetworkingUnitTestsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let promise = expectation(description: "should dl something")
        Networking.callApi(url: "https://google.com") { (data, error) in
            print(error)
            print(data)
            
            XCTAssertNil(error)
            XCTAssertNotNil(data)
            promise.fulfill()
        }z

        waitForExpectations(timeout: 5){ error in
            guard error == nil else {
                print("FAILED")
                XCTFail()
                return
            }
        }
    }
    
//    func testFailExample() {
//        let promise = expectation(description: "should dl something")
//        Networking.callApi(url: "https://zxxz.vom") { data, error in
//            XCTAssertNil(error)
//            XCTAssertNotNil(data)
//
//            promise.fulfill()
//        }
//
//        waitForExpectations(timeout: 3){ error in
//            guard error == nil else {
//                XCTFail()
//                return
//            }
//        }
//    }
//
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
