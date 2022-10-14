//
//  CoordinatorTest.swift
//  TheMovieDBTests
//
//  Created by Agustin Godoy Cosser on 14/10/2022.
//

import XCTest
@testable import TheMovieDB

final class CoordinatorTest: XCTestCase {

    var sut: MainCoordinator!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func testStart() {
        sut.start()
        let classType = String(describing: sut.navigationController.topViewController)
        XCTAssertEqual(classType, "SplashScreenViewController" , "Score computed from guess is wrong")
    }

}
