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
        let testNC = UINavigationController()
        sut = MainCoordinator(testNC)
        UIApplication.shared.keyWindow?.rootViewController = testNC
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func testFlow() {
        
        sut.start()
        
        XCTAssertNotNil(sut.navigationController.topViewController as? SplashScreenViewController)
        
        let predicate = NSPredicate(block: { testC, _ in
            guard let testC = (testC as? Coordinator)?.navigationController else {
                return false
            }
            print(testC)
            return testC.topViewController as? MainViewController != nil
        })
            
        let mainScreenExpectation = expectation(
            for: predicate,
            evaluatedWith: sut,
            handler: nil
        )
        
        wait(
            for: [mainScreenExpectation],
            timeout: 5
        )
        
    }

}
