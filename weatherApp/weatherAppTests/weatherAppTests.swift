//
//  weatherAppTests.swift
//  weatherAppTests
//
//  Created by Sam Roman on 10/9/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//

import XCTest
@testable import weatherApp

class weatherAppTests: XCTestCase {

//    override func setUp() {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDown() {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testExample() {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }

    func testWeatherAPIClient() {
        guard let path = Bundle.main.path(forResource: "weatherTest", ofType: "json") else { return }
        
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url)
            let testArr = try Weather.getForecastFromData(data: data)
            XCTAssert(testArr.count > 0, "We have \(testArr.count) listings")
        } catch {
            print(error)
            XCTFail()
        }
    }
    
    
}


