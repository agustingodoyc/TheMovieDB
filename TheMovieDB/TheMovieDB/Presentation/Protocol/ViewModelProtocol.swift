//
//  ViewModelProtocol.swift
//  TheMovieDB
//
//  Created by Angela Lee on 16/11/2022.
//

import Foundation

protocol RegisterViewModelProtocol {
    var registerUseCase: RegisterProtocol { get set }
    var delegate: RegisterViewModelDelegate? { get set }
    func createUser(userName: String, password: String) -> RegisterResult
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
