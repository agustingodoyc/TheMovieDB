//
//  UseCase.swift
//  TheMovieDB
//
//  Created by Angela Lee on 31/10/2022.
//

import Foundation

enum RegisterResult: String {
    case success
    case usernameError
    case dataBaseError
}

protocol TabBarUseCaseProtocol: AnyObject {
    var delegate: UseCaseDelegate? { get set }
    func execute(completionHandler: @escaping ([Movie]) -> Void)
}

protocol UseCaseProtocol {
    func execute(completionHandler: @escaping ([Movie]) -> Void)
}

protocol RegisterProtocol {
    func execute(userName: String, password: String) -> RegisterResult
}

protocol DetailsUseCase {
    func execute(movieId: String, completionHandler: @escaping (MovieDetail) -> Void)
}

protocol NetworkConnection {
    func execute() -> Bool
}

protocol UseCaseDelegate: AnyObject {
    func updateMovie(data: [Movie])
}
