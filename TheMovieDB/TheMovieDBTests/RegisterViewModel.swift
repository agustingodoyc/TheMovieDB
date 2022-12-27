//
//  RegisterViewModel.swift
//  TheMovieDBTests
//
//  Created by Angela Lee on 22/12/2022.
//

import XCTest
@testable import TheMovieDB

final class RegisterViewModelTest: XCTestCase {

    var sut: RegisterViewModel!
    
    class RegisterUseCaseMock: RegisterUseCaseProtocol {
        func execute(userName: String, password: String) -> TheMovieDB.RegisterResult {
            guard userName == "NewUser" && password == "1234" else {
                if userName == "ExistentUser" {
                    return .usernameError
                } else {
                    return .dataBaseError
                }
            }
            return .success
        }
    }
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut =   RegisterViewModel(registerUseCase: RegisterUseCaseMock())
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testRegisterViewModelWithExitedUser() {
        let existedUser = User(userName: "ExistentUser", password: "1234")
        let test = sut.createUser(userName: existedUser.userName, password: existedUser.password)
        XCTAssertEqual(test, .usernameError)
    }
    
    func testRegisterViewModelWithNewUser() {
        let newUser = User(userName: "NewUser", password: "1234")
        let test = sut.createUser(userName: newUser.userName, password: newUser.password)
        XCTAssertEqual(test, .success)
    }
    
    func testRegisterViewModelWithDataBaseError() {
        let databaseError = User(userName: "databaseError", password: "1234")
        let test = sut.createUser(userName: databaseError.userName, password: databaseError.password)
        XCTAssertEqual(test, .dataBaseError)
    }
}
