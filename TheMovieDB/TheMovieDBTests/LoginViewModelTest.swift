//
//  LoginViewModelTest.swift
//  TheMovieDBTests
//
//  Created by Angela Lee on 27/12/2022.
//

import XCTest
@testable import TheMovieDB

final class LoginViewModelTest: XCTestCase {

    var sut: LoginViewModel!
    
    class LoginUseCaseMock: LoginUseCaseProtocol {
        func execute(userName: String, password: String) -> TheMovieDB.LoginResult {
            guard userName == "AngelaLee" && password == "1234" else {
                if password != "1234" {
                    return .passwordError
                } else {
                    return .usernameError
                }
            }
            return .success
        }
    }
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut =   LoginViewModel(loginUseCase: LoginUseCaseMock())
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testLoginViewModelWithCorrectUserData() {
        let correctUser = User(userName: "AngelaLee", password: "1234")
        let test = sut.login(userName: correctUser.userName, password: correctUser.password)
        XCTAssertEqual(test, .success)
    }
    
    func testLoginViewModelWithIncorrectPassword() {
        let userWithIncorrectPassword = User(userName: "AngelaLee", password: "123")
        let test = sut.login(userName: userWithIncorrectPassword.userName, password: userWithIncorrectPassword.password)
        XCTAssertEqual(test, .passwordError)
    }
    
    func testRegisterViewModelWithDataBaseError() {
        let nonExistenUser = User(userName: "nonExistenUser", password: "1234")
        let test = sut.login(userName: nonExistenUser.userName, password: nonExistenUser.password)
        XCTAssertEqual(test, .usernameError)
    }
}
