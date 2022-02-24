//
//  MortgageCalculatorTests.swift
//  MortgageCalculatorTests
//
//  Created by Isaac Pitblado on 2/21/22.
//

import XCTest
@testable import MortgageCalculator

class MortgageCalculatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let x = ExcelFormulas.myPmt(rate: 0.0325/12, nper: 360, pv: 400000)
        let y = ExcelFormulas.pmt(rate: 0.0325/12, nper: 360, pv: 400000)
        print("x=\(x)")
        print("y=\(y)")
        
        let fv = ExcelFormulas.myFv(rate: 0.0325/12, nper: 24, pv: 400000, c: x)
        let fvEx = ExcelFormulas.myFv(rate: 0.07/12, nper: 358, pv: 165000, c: ExcelFormulas.pmt(rate: 0.07/12, nper: 360, pv: 165000))
        let ipmt = ExcelFormulas.myipmt(rate: 0.0325/12, per: 24, nPer: 360, pv: 400000, fv: 0)
        print("fv=\(fv)")
        print("fvEx=\(fvEx)")
        print("ipmt=\(ipmt)")
        XCTAssertEqual(x, y, "PMT Formula not equal")
//        XCTAssertEqual(x, 0, "PMT Formula not equal")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
