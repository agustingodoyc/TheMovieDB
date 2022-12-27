//
//  LoginUseCaseTest.swift
//  TheMovieDBTests
//
//  Created by Angela Lee on 27/12/2022.
//

import XCTest
@testable import TheMovieDB

final class LoginUseCaseTest: XCTestCase {

    var sut: LoginUseCase!
    
    class DataManagerMock: LoginProtocol {
        func validateUser(userName: String, password: String) -> Bool {
            if userName == "AngelaLee" && password == "1234" {
                return true
            } else {
                return false
            }
        }
        
        func checkUserName(userName: String) -> Bool {
            if userName == "AngelaLee" {
                return false
            } else {
                return true
            }
        }
    }
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut =   LoginUseCase(dataManager: DataManagerMock())
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testUseCaseExecuteWithCorrectEnterData() {
        let correctUser = User(userName: "AngelaLee", password: "1234")
        let test = sut.execute(userName: correctUser.userName, password: correctUser.password)
        XCTAssertEqual(test, .success)
    }
    
    func testUseCaseExecuteWithIncorrectPassword() {
        let userWithIncorrectPassword = User(userName: "AngelaLee", password: "123")
        let test = sut.execute(userName: userWithIncorrectPassword.userName, password: userWithIncorrectPassword.password)
        XCTAssertEqual(test, .passwordError)
    }
    
    func testUseCaseExecuteWithINonExistentUser() {
        let nonExistenUser = User(userName: "Angela1", password: "1234")
        let test = sut.execute(userName: nonExistenUser.userName, password: nonExistenUser.password)
        XCTAssertEqual(test, .usernameError)
    }
}
