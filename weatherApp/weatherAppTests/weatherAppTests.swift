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
    
    func testWeatherAPIClient() {
        guard let path = Bundle.main.path(forResource: "weatherTest", ofType: "json") else { return }
        
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url)
            let testArr = try Weather.getForecastFromData(data: data)
            XCTAssert((testArr?.daily?.data!.count)! > 0, "We have \(testArr?.daily?.data?.count ?? 0) listings")
        } catch {
            print(error)
            XCTFail()
        }
    }
    
    
}


