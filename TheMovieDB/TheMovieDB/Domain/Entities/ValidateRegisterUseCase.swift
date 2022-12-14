//
//  ValidateRegister.swift
//  TheMovieDB
//
//  Created by Angela Lee on 14/12/2022.
//

import Foundation

class ValidateRegisterUseCase: ValidateRegisterProtocol {
   
    private var dataManager: DataManager
    
    init(_ dataManager: DataManager = DataManager()) {
        self.dataManager = dataManager
    }
    
    func execute(userName: String) -> Bool {
       return dataManager.checkUserName(userName: userName)
    }
}
