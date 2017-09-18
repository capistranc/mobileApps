//
//  testDrivenExampleTests.swift
//  testDrivenExampleTests
//
//  Created by Mac on 9/18/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import XCTest
@testable import testDrivenExample


class testDrivenExampleTests: XCTestCase {
    var vm = ViewModel(delegate:nil)
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMultiply() {
        XCTAssertEqual(vm.multiply(x:2, y:5), 10)
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testMultiplyFail() {
        XCTAssertFalse(vm.multiply(x:2,y:5) == 12, "Should be 10")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
