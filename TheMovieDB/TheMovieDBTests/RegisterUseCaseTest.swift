//
//  RegisterUseCaseTest.swift
//  TheMovieDBTests
//
//  Created by Angela Lee on 21/12/2022.
//

import XCTest
@testable import TheMovieDB

final class RegisterUseCaseTest: XCTestCase {

    var sut: RegisterUseCase!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = RegisterUseCase()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testUseCaseExecuteWithExitedUser() {
        let existedUser = User(userName: "AngelaLee", password: "1234")
        let test = sut.execute(userName: existedUser.userName, password: existedUser.password)
        XCTAssertEqual(test, .usernameError)
    }
    
    func testUseCaseExecuteWithNewUser() {
        let newUser = User(userName: "AngieLee", password: "1234")
        let test = sut.execute(userName: newUser.userName, password: newUser.password)
        XCTAssertEqual(test, .success)
    }
}
