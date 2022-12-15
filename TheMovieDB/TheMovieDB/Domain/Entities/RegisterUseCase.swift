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
        //checkear usuario
        guard dataManager.checkUserName(userName: userName) else {
            //Error username
            return
        }

        guard dataManager.createUser(userName: userName, password: password) else {
            //Database Error
            return
        }
        //success 
    }
}
