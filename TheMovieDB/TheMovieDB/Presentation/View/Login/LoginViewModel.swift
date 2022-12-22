//
//  LoginViewModel.swift
//  TheMovieDB
//
//  Created by Angela Lee on 13/12/2022.
//

import Foundation

class LoginViewModel {
    var registerUseCase: RegisterProtocol
    weak var delegate: RegisterViewModelDelegate?
    
    init (registerUseCase:
          RegisterProtocol = RegisterUseCase()) {
        self.registerUseCase = registerUseCase
    }
}
