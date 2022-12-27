//
//  ViewModelDelegate.swift
//  TheMovieDB
//
//  Created by Agustin Godoy Cosser on 21/10/2022.
//

import Foundation

protocol ViewModelDelegate: AnyObject {
    func reloadData()
}

protocol RegisterViewModelDelegate: AnyObject {
    func registerResult(registerResult: RegisterResult) -> RegisterResult
}
