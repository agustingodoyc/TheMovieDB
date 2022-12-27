//
//  ViewModelProtocol.swift
//  TheMovieDB
//
//  Created by Angela Lee on 16/11/2022.
//

import Foundation

enum RegisterResult: String {
    case success
    case usernameError
    case dataBaseError
}

enum LoginResult: String {
    case success
    case usernameError
    case passwordError
}

protocol RegisterViewModelProtocol {
    var registerUseCase: RegisterUseCaseProtocol { get set }
    func createUser(userName: String, password: String) -> RegisterResult
}

protocol LoginViewModelProtocol {
    var loginUseCase: LoginUseCaseProtocol { get set }
    func login(userName: String, password: String) -> LoginResult
}
protocol SearchViewModelProtocol {
    func getNumberOfRowOfMovies() -> Int
    func getMovies(indexPath: Int) -> SearchCellModel
}

protocol ViewModel {
    var movies: [Movie] { get set }
    var useCase: TabBarUseCaseProtocol { get set }
    var delegate: ViewModelDelegate? { get set }
    
    func updateMovie(data: [Movie])
}

extension ViewModel {
    mutating func updateMovie(data: [Movie]) {
        self.movies = data
    }
}
