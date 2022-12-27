//
//  LoginViewModel.swift
//  TheMovieDB
//
//  Created by Angela Lee on 13/12/2022.
//

import Foundation

class LoginViewModel: LoginViewModelProtocol {
    var loginUseCase: LoginUseCaseProtocol
    weak var delegate: RegisterViewModelDelegate?
    
    init (loginUseCase:
          LoginUseCaseProtocol = LoginUseCase()) {
        self.loginUseCase = loginUseCase
    }
    
    func login(userName: String, password: String) -> LoginResult {
        guard loginUseCase.execute(userName: userName, password: password) == .success else {
            if loginUseCase.execute(userName: userName, password: password) == .usernameError {
                return .usernameError
            } else {
                return .passwordError
            }
        }
        return .success
        
    }
}
