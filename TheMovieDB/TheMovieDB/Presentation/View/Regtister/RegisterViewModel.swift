//
//  RegisterViewModel.swift
//  TheMovieDB
//
//  Created by Angela Lee on 13/12/2022.
//

import Foundation

class RegisterViewModel {
    var registerUseCase: RegisterProtocol
    var validateRegisterUseCase: ValidateRegisterProtocol
    
    init (registerUseCase: RegisterProtocol = RegisterUseCase(), validateRegisterUseCase: ValidateRegisterProtocol = ValidateRegisterUseCase()) {
        self.registerUseCase = registerUseCase
        self.validateRegisterUseCase = validateRegisterUseCase
    }
    
    func createUser(userName: String, password: String, passwordConfirm: String) -> RegisterResult {
        //success o falied
        guard (validateRegisterUseCase.execute(userName: userName) == true) && (password == passwordConfirm) else {
            if (validateRegisterUseCase.execute(userName: userName) == false) {
                return .existedUserName
            } else {
                return .passwordError
            }
        }
        registerUseCase.execute(userName: userName, password: password)
        return .success
    }
}
