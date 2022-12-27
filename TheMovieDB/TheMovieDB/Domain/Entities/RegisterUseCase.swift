//
//  RegisterUseCase.swift
//  TheMovieDB
//
//  Created by Angela Lee on 14/12/2022.
//

import Foundation

class RegisterUseCase: RegisterUseCaseProtocol {
    
    private var dataManager: CreateUserProtocol
    
    init(dataManager: CreateUserProtocol = DataManager()) {
        self.dataManager = dataManager
    }
    
    func execute(userName: String, password: String) -> RegisterResult {
        guard dataManager.checkUserName(userName: userName) else {
            return .usernameError
        }
        
        guard dataManager.createUser(userName: userName, password: password) else {
            return .dataBaseError
        }
        return .success
    }
}
