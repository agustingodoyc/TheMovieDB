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
    
    class DataManagerMock: CreateUserProtocol {
        func createUser(userName: String, password: String) -> Bool {
            if userName == "User2" && password == "1234" {
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
        sut =   RegisterUseCase(dataManager: DataManagerMock())
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
        let newUser = User(userName: "User2", password: "1234")
        let test = sut.execute(userName: newUser.userName, password: newUser.password)
        XCTAssertEqual(test, .success)
    }
}
