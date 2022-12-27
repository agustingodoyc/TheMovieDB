//
//  RegisterViewModel.swift
//  TheMovieDB
//
//  Created by Angela Lee on 13/12/2022.
//

import Foundation

class RegisterViewModel: RegisterViewModelProtocol {
    // MARK: -Properties
    var registerUseCase: RegisterUseCaseProtocol
    
    init (registerUseCase:
          RegisterUseCaseProtocol = RegisterUseCase()) {
        self.registerUseCase = registerUseCase
    }
    
    func createUser(userName: String, password: String) -> RegisterResult {
        guard registerUseCase.execute(userName: userName, password: password) == .success else {
            if registerUseCase.execute(userName: userName, password: password) == .usernameError {
                return.usernameError
            } else {
                return .dataBaseError
            }
        }
        return .success
    }
}
