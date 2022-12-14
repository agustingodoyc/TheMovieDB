//
//  RegisterUseCase.swift
//  TheMovieDB
//
//  Created by Angela Lee on 14/12/2022.
//

import Foundation

class RegisterUseCase: RegisterProtocol {
    
    private var dataManager: DataManager
    
    init(_ dataManager: DataManager = DataManager()) {
        self.dataManager = dataManager
    }
    
    func execute(userName: String, password: String) {
        dataManager.createUser(userName: userName, password: password)
    }
}
