//
//  LoginUseCase.swift
//  TheMovieDB
//
//  Created by Angela Lee on 22/12/2022.
//

import Foundation

class LoginUseCase: LoginUseCaseProtocol {
    
    private var dataManager: LoginProtocol
    
    init(dataManager: LoginProtocol = DataManager()) {
        self.dataManager = dataManager
    }
    
    func execute(userName: String, password: String) -> LoginResult {
        guard dataManager.validateUser(userName: userName, password: password) == true else {
            if dataManager.checkUserName(userName: userName) == true {
                return .usernameError
            } else {
                return .passwordError
            }
        }
        return .success
    }
}
